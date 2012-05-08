/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import Model.Logs_t;
import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleTypes;

/**
 *
 * @author patricio
 */
public class Login {

    public Login() { } 

    //verifica se o login do usuário é válido, supondo que nem o username e
    // nem o password sejam NULOS
    public int check(String username, String password) throws ClassNotFoundException, SQLException {

        // abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackLogin.checkLogin(?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //prepara os parâmetros de entrada e saída
        //parâmetro de entrada 1
        cs.setString(1, username);
        //parâmetro de entrada 2
        cs.setString(2, password);

        //parâmetro de saída
        cs.registerOutParameter(3, java.sql.Types.INTEGER);

        //execução do procedimento armazenado
        cs.execute();

        //recuperação do valor retornado da função
        int ret = cs.getInt(3);

        //fecha a conexão com o banco de dados
        db.close();

        return ret;
    }

    //cria os logs referentes ao login e logout de um usuário
    public static void log(int v_idusuario, String DataIn) throws ClassNotFoundException, SQLException {
        // abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackLogin.insertAcces(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //prepara os parâmetros de entrada e saída
        //parâmetro de entrada 1
        cs.setInt(1, v_idusuario);
        //parâmetro de entrada 2
        cs.setString(2, DataIn);

        //execução do procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();
    }

    //retorna o log de entrada/saída de um usuário
    public static Logs_t getLogs(int v_idusuario) throws ClassNotFoundException, SQLException {
        Array l1 = null;
        Array l2 = null;

        // abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackLogin.getLogs(?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //prepara os parâmetros de entrada e saída
        //parâmetros de entrada
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Logs_t.ORACLE_USER_ARRAY_NAME);
        cs.registerOutParameter(3, OracleTypes.ARRAY, Logs_t.ORACLE_USER_ARRAY_NAME);

        //execução do procedimento armazenado
        cs.execute();

        l1 = cs.getArray(2);
        l2 = cs.getArray(3);

        Logs_t l = new Logs_t(l1, l2); 

        //fecha a conexão com o banco de dados
        db.close();

        return l; 
    }
}
