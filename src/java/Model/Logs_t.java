/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.sql.Array;
import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

/**
 *
 * @author patricio
 */
public class Logs_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "LOG_T";

    public static final String ORACLE_USER_ARRAY_NAME = "LOGS";

    private Array LogEntrada;
    private Array LogSaida;

    public Logs_t(Array LogEntrada, Array LogSaida) {
        this.LogEntrada = LogEntrada;
        this.LogSaida = LogSaida;
    }

    public Logs_t() {
    }

    public Array getLogEntrada() {
        return LogEntrada;
    }

    public void setLogEntrada(Array LogEntrada) {
        this.LogEntrada = LogEntrada;
    }

    public Array getLogSaida() {
        return LogSaida;
    }

    public void setLogSaida(Array LogSaida) {
        this.LogSaida = LogSaida;
    }

    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return Post_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setLogEntrada(stream.readArray());
        this.setLogSaida(stream.readArray());
    }


    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeArray(this.getLogEntrada());
        stream.writeArray(this.getLogSaida()); 
    }

}
