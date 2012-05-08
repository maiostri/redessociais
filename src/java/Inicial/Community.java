/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import Model.Community_t;
import Model.Initial_Community_t;
import Model.User_t;
import java.sql.CallableStatement;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleTypes;

/**
 *
 * @author patricio
 *
 * classe que armazenará todos as operações sobre comunidades
 *
 */
public class Community {

    public Community() {
    }

    // recupera as informações iniciais de todas as comunidades de um usuário
    public Object[] getInitialCommunities(int v_idusuario) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] communities = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.getInicialCommunities(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Initial_Community_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        communities = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return communities;
    }


    // recupera as comunidades de um usuário
    public static Object[] getCommunities(int v_idusuario) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] communities = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.getCommunities(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Community_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        communities = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return communities;
    }

    // recupera as comunidades de um usuário
    public static Object[] getUsersCommunities(int v_idusuario, String NomeComunidade) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        Object[] users = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.getUsersCommunities(?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(2, NomeComunidade);
        cs.registerOutParameter(3, OracleTypes.ARRAY, User_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        users = (Object[])cs.getArray(3).getArray(); 

        //fecha a conexão com o banco de dados
        db.close();

        return users; 
    }


    //atualiza os dados de uma comunidade
    public static void updateCommunity(int v_idusuario, String NomeComunidade, String Descricao, String Categoria) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.updateCommunity(?, ?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(2, NomeComunidade);
        cs.setString(3, Descricao);
        cs.setString(4, Categoria); 

        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();
    }


    //atualiza os dados de uma comunidade
    public static void insertCommunity(int v_idusuario, String NomeComunidade, String Descricao, String Categoria) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.insertCommunity(?, ?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(2, NomeComunidade);
        cs.setString(3, Descricao);
        cs.setString(4, Categoria);

        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();
    }

    //remove uma comunidade e todos os seus objetos
    public static void removeCommunity(int v_idusuario, String NomeComunidade) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.removeCommunity(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setString(2, NomeComunidade);

        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();
    }


    // recupera as comunidades de um usuário
    public static Object[] getCommunitiesP(int v_idusuario) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] communities = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.getCommunitiesP(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Community_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        communities = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return communities;
    }


    //deixa de participar de uma comunidade
    public static void exitCommunity(int v_idusuario, int v_idusuariocom, String Nome) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackCommunity.exitCommunity(?, ?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.setInt(2, v_idusuariocom);
        cs.setString(3, Nome); 

        //executa o procedimento armazenado
        cs.execute();

        //fecha a conexão com o banco de dados
        db.close();

    }
}
