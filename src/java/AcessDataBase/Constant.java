/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package AcessDataBase;

/**
 *
 * @author patricio
 */
public interface Constant {

    //URL conectado na rede grad (no icmc)
    //public String url = "jdbc:oracle:thin:@192.168.183.2:1521:orcl";

    //URL conectado na grad e no servidor via SSH
    public String url = "jdbc:oracle:thin:@localhost:1521:orcl";

    //URL da conexão local com o banco
    //public String url = "jdbc:oracle:thin:@localhost:1522:xe";

    public String username = "p6426614";
    public String password = "123456";
    public String driver = "oracle.jdbc.OracleDriver";
}
