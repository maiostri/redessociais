/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import Model.Comment_t;
import Model.Post_t;
import java.sql.CallableStatement;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleTypes;

/**
 *
 * @author patricio
 */
public class Post {

    public Post() {

    }

    // método que recupera todos os posts e os seus comentários de um usuário
    public Object[] getPosts(int v_idusuario) throws SQLException, ClassNotFoundException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] posts = null; 

        //String que chama um procedimento armazenado
        String SQL = "{call PackPost.getPosts(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Post_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        posts = (Object[])cs.getArray(2).getArray(); 

        //fecha a conexão com o banco de dados
        db.close();

        return posts; 

    }

    public Object[] getCommentPost(int v_post) throws SQLException, ClassNotFoundException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] comments = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackPost.getCommentPosts(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_post);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Comment_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        comments = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return comments;

    }

   //insere um post
    public static void insertPost(int v_idusuario, String LinkPost, String Conteudo) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackPost.insertPost(?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(3, LinkPost);
        cs.setString(2, Conteudo);

        //executa o procedimento armazenado
        cs.execute();        

        //fecha a conexão com o banco de dados
        db.close();
    }

    //insere um post
    public static void removePost(int v_idPost) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackPost.removePost(?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idPost); 
       
        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();
    }


    // insere um comentário em um post
    //adiciona um comentário a um álbum
    public static void insertCommentPost(int v_idusuario, int v_idobjeto, String Conteudo, String LinkPost) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackPost.insertCommentPost(?, ?, ?, ?)}";

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

}
