/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import Model.User_t;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author patricio
 * Faz a inserção usando procedimento armazenado do oracle de um usuário na base de dados
 */
public class User {

    public User() { }

    //faz a inserção de um usuário no banco de dados, por meio de um procedimento
    //armazenado do oracle e retorna o id do usuário inserido. Caso a inserção não
    //ocorra, a devida exceção é lançada para a aplicação
    public void insertUser(User_t user) throws ClassNotFoundException, SQLException {

        // abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackUser.insert_user(?)}"; 

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //configurar o parâmetro como entrada
        cs.setObject(1, user);

        //configurar como parâemtro de saída
        cs.registerOutParameter(1, java.sql.Types.STRUCT, User_t.ORACLE_OBJECT_NAME); 
        //execução do procedimento armazenado
        boolean execute = cs.execute();

        //atualiza no banco de dados a inserção
        db.commit();

        //recupera o parâmetro de saída
        User_t temp = (User_t)cs.getObject(1); 

        //fecha a conexão com o banco de dados
        db.close();
    }

    //recupera as informações a serem mostradas na página inicial do usuário
    public User_t consultDataInitial(int v_idusuario) throws ClassNotFoundException, SQLException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //cria o usuário que será retornado
        User_t current_user = null; 

        //String que chama um procedimento armazenado
        String SQL = "{call PackUser.consult_data_user(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, java.sql.Types.STRUCT, User_t.ORACLE_OBJECT_NAME);

        //executa o procedimento armazenado
        cs.execute();

        //recupera os registros de saída
        current_user = (User_t)cs.getObject(2); 

        //fecha a conexão com o banco de dados
        db.close();

        return current_user;
    }

    //atualiza as informações de um usuário
    public void updateUser(User_t user) throws ClassNotFoundException, SQLException {

        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //cria o usuário que será retornado
        User_t current_user = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackUser.update_data_user(?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setObject(1, user);

        //executa o procedimento armazenado
        cs.execute();

        //atualiza no banco de dados a inserção
        db.commit();

        //fecha a conexão com o banco de dados
        db.close();
    }

    //altera a senha de um usuário
    public void alterSenha(int v_idusuario, String new_senha) throws ClassNotFoundException, SQLException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackUser.update_password(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(2, new_senha); 

        //executa o procedimento armazenado
        cs.execute();

        //atualiza no banco de dados a inserção
        db.commit();

        //fecha a conexão com o banco de dados
        db.close();
    }

    //altera o Nick de um usuário
    public void alterNick(int v_idusuario, String new_nick) throws ClassNotFoundException, SQLException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackUser.update_nick(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(2, new_nick);

        //executa o procedimento armazenado
        cs.execute();

        //atualiza no banco de dados a inserção
        db.commit();

        //fecha a conexão com o banco de dados
        db.close();
    }


    //retorna o nick de um usuário por meio de seu ID
    public static String getNick(int v_idusuario) throws ClassNotFoundException, SQLException {
        
        String Nick = null;

        ConnectionDataBase db = new ConnectionDataBase();

        String SQL = "SELECT Com.Nick FROM Conta Com JOIN Usuario U ON U.IdUsuario = Com.IdUsuario WHERE U.IdUsuario = " + v_idusuario;        

        ResultSet rs = db.query(SQL);

        while (rs.next()) {
            Nick = rs.getString(1);
        }

        rs.close(); 
        db.close();

        return Nick;
    }
}
