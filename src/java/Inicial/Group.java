/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import Model.Group_t;
import java.sql.CallableStatement;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleTypes;

/**
 *
 * @author ricardo
 */
public class Group {

    public Group() {
    }

    public Object[] getGroups(int v_idusuario) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] groups = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackGroups.getGroups(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, Group_t.ORACLE_USER_ARRAY_NAME);

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        groups = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return groups;

    }

   public void changeGroup(int v_idusuario, int v_amigo, String grupo) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        String SQL = "{call PackGroups.changeGroup(?,?,?)}";

        CallableStatement cs = db.prepareStoredProcedure(SQL);

        cs.setInt(1, v_idusuario);
        cs.setInt(2, v_amigo);
        cs.setString(3, grupo);
        cs.execute();

        db.commit();

        db.close();

   }

   public Object[] getGroupsUser(int v_idusuario) throws SQLException, ClassNotFoundException {

       //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //array de posts retornado pela procedure
        Object[] groups = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackGroups.getGroupsUser(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, "GRUPOOS");

        //executa o procedimento armazenado
        cs.execute();

        // recupera os dados de saída do procedimento
        groups = (Object[])cs.getArray(2).getArray();

        //fecha a conexão com o banco de dados
        db.close();

        return groups;       
   }

   public void createGroup(int v_idusuario, String grupo) throws ClassNotFoundException, SQLException {

        // abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //String que chama um procedimento armazenado
        String SQL = "{call PackGroups.createGroup(?,?)}"; 

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //configurar o parâemtro como de entrada
        cs.setObject(1, v_idusuario);

        cs.setObject(2, grupo);

        //configurar como parâemtro de saída
                //execução do procedimento armazenado
        cs.execute();

        //atualiza no banco de dados a inserção
        db.commit();

        //fecha a conexão com o banco de dados
        db.close();
    }


}
