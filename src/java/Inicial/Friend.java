/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import Model.Friend_t;
import java.sql.CallableStatement;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleTypes;

/**
 *
 * @author patricio
 */
public class Friend {

    public Friend() {
    }

    public Object[] getFriends(int v_idusuario) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] friends = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackFriends.getFriends(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Friend_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        friends = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return friends;
    }

    public void removeFriend(int v_idusuario, int v_amigo) throws SQLException, ClassNotFoundException {

       ConnectionDataBase db = new ConnectionDataBase();

       String SQL = "{call PackFriends.removeFriend(?, ?)}";

       CallableStatement cs = db.prepareStoredProcedure(SQL);

       cs.setInt(1, v_idusuario);
       cs.setInt(2, v_amigo);

       cs.execute();

       db.commit();

       db.close();

    }

}
