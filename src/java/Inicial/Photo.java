/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import Model.Album_t;
import Model.Comment_t;
import Model.Photo_t;
import java.sql.PreparedStatement;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author patricio
 *
 * CLASSE QUE TRATA TODAS AS OPERAÇÕES SOBRE FOTOS E ÁLBUNS
 */

public class Photo {

    //insere a foto do perfil no banco
    public void insertPhotoProfile(int v_idusuario, String pathPhoto) throws ClassNotFoundException, SQLException, IOException {

        ConnectionDataBase db = new ConnectionDataBase();

        String SQL = "UPDATE Usuario SET Foto = ? WHERE IdUsuario = ?";

        PreparedStatement ps = db.preparePreparedStatement(SQL); 
        
        File fBlob = new File (pathPhoto);
        FileInputStream is = new FileInputStream (fBlob);
        ps.setBinaryStream (1, is, (int)fBlob.length());

        ps.setInt(2, v_idusuario); 

        ps.execute ();
        
        db.commit(); 

        db.close();
    }

    //recupera a foto do perfil
    public static byte[] getPhotoProfile(int v_idusuario) throws ClassNotFoundException, SQLException {

        ConnectionDataBase db = new ConnectionDataBase();
        Blob img = null;
        byte[] imgData = null ;

        String SQL = "SELECT Foto FROM Usuario WHERE IdUsuario = " + v_idusuario;

        ResultSet rs = db.query(SQL);

        while (rs.next()) {
            img = rs.getBlob(1);
            imgData = img.getBytes(1, (int)img.length());
        }

        rs.close();
        db.close(); 
    
        return imgData;
    }

    //recupera todos os álbuns de um usuário
    public static Object[] getAlbums(int v_idusuario) throws ClassNotFoundException, SQLException {

        ConnectionDataBase db = new ConnectionDataBase();
        
        Object[] albums = null ;

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.getAlbums(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Album_t.ORACLE_USER_ARRAY_NAME); 

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        albums = (Object[])cs.getArray(2).getArray();

        db.close();

        return albums;
    }

    //recupera os comentários de uma comunidade
    public static Object[] getCommentAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] comments = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.getCommentsAlbum(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idobjeto);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Comment_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        comments = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return comments;
    }

    //recupera as fotos de um álbum
    public static Object[] getPhotosAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] photos = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.getPhotosAlbum(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idobjeto);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Photo_t.ORACLE_USER_ARRAY_NAME); 

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        photos = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return photos;
    }

    // recupera uma foto de um álbum por meio de seu id
    public static byte[] getPhoto(int v_idobjeto) throws SQLException, ClassNotFoundException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        byte[] b_photo = null;
        Photo_t photo = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.getPhoto(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idobjeto);
        cs.registerOutParameter(2, java.sql.Types.STRUCT, Photo_t.ORACLE_OBJECT_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        photo = (Photo_t)cs.getObject(2);

        b_photo = photo.getImagem().getBytes(1, (int)photo.getImagem().length());

        //fecha a conexão com o banco de dados
        db.close();

        return b_photo;
    }


    // retorna o número de comentarios sobre um álbum
    public static int getNCommentsAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        int nro = 0;

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.getNCommentsAlbum(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idobjeto);
        cs.registerOutParameter(2, java.sql.Types.NUMERIC); 

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        nro = cs.getInt(2);

        //fecha a conexão com o banco de dados
        db.close();

        return nro;
    }

    //retorna o número de fotos de um álbum
    public static int getNPhotosAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        int nro = 0;

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.getNPhotosAlbum(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idobjeto);
        cs.registerOutParameter(2, java.sql.Types.NUMERIC);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        nro = cs.getInt(2);

        //fecha a conexão com o banco de dados
        db.close();

        return nro;
    }


    //insere um álbum no banco de dados
    public static void insertAlbum(int v_idusuario, String NomeAlbum, String LocalAlbum) throws SQLException, ClassNotFoundException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.insertAlbum(?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(2, NomeAlbum);
        cs.setString(3, LocalAlbum);

        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();


    }

    //remove um álbum do banco de dados
    public static void removeAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.removeAlbum(?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idobjeto);

        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();
    }


    //adiciona um comentário a um álbum
    public static void insertCommentAlbum(int v_idusuario, int v_idobjeto, String Conteudo, String LinkPost) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackPhoto.insertCommentAlbum(?, ?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setInt(2, v_idobjeto);
        cs.setString(3, Conteudo);
        cs.setString(4, LinkPost);  

        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();
    }



    //insere a foto do perfil no banco
    public static void insertPhotoAlbum(int v_idusuario, int v_idalbum, String Arquivo, String Descricao) throws ClassNotFoundException, SQLException, IOException {

        String pathPhoto = "/home/ricardo/" + Arquivo;
        int v_idfoto = 0; 

        ConnectionDataBase db = new ConnectionDataBase();

        String SQL = "{call PackPhoto.insertPhotoAlbum(?, ?, ?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setInt(2, v_idalbum);
        cs.setString(4, Descricao);
        cs.setString(5, Arquivo);
        cs.registerOutParameter(3, java.sql.Types.NUMERIC); 

        //executa o procedimento armazenado
        cs.execute();

        v_idfoto = cs.getInt(3); 

        SQL = "UPDATE Foto SET Imagem = ? WHERE IdObjeto = ?";

        PreparedStatement ps = db.preparePreparedStatement(SQL);

        File fBlob = new File(pathPhoto);
        FileInputStream is = new FileInputStream(fBlob);
        ps.setBinaryStream(1, is, (int)fBlob.length());

        ps.setInt(2, v_idfoto); 

        ps.execute ();

        db.commit();

        db.close();
    }


    // remove uma foto do álbum
    public static void removePhotoAlbum(int v_idfoto, int v_idalbum) throws ClassNotFoundException, SQLException {
        ConnectionDataBase db = new ConnectionDataBase();

        String SQL = "{call PackPhoto.removePhotoAlbum(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idfoto);
        cs.setInt(2, v_idalbum);

        //executa o procedimento armazenado
        cs.execute();

        db.close(); 
    }


}
