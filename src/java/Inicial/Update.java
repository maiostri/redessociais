/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Inicial;

import AcessDataBase.ConnectionDataBase;
import java.sql.CallableStatement;
import java.sql.SQLException;
import oracle.jdbc.driver.OracleTypes;

/**
 *
 * @author patricio
 */
public class Update {

    public Update() {
    }

    //recupera as atualizações de um usuário
    public Object[] getUpdates(int v_idusuario) throws SQLException, ClassNotFoundException {
        //abre uma conexão com o banco de dados
        ConnectionDataBase db = new ConnectionDataBase();

        //cria o usuário que será retornado
        Object[] updates = null;

        //String que chama um procedimento armazenado
        String SQL = "{call PackInicialPage.getUpdates(?, ?)}";

        //chama o método para tratar a execução de procedimentos armazenados
        CallableStatement cs = db.prepareStoredProcedure(SQL);

        //especificação dos parâmetros
        cs.setInt(1, v_idusuario);
        cs.registerOutParameter(2, OracleTypes.ARRAY, "UPDATES");

        //executa o procedimento armazenado
        cs.execute();

        //recupera os registros de saída
        updates = (Object[])cs.getArray(2).getArray(); 

        //fecha a conexão com o banco de dados
        db.close();

        return updates;
    }

}
