/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

/**
 *
 * @author patricio
 */
public class Comment_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "COMMENT_T";

    public static final String ORACLE_USER_ARRAY_NAME = "COMMENTS";


    private String Nick;
    private String Comm;
    private String DataHora;


    public Comment_t(String Nick, String Comm, String DataHora) {
        this.Nick = Nick;
        this.Comm = Comm;
        this.DataHora = DataHora;
    }


    public Comment_t() {
    }

    
    public String getComm() {
        return Comm;
    }

    public void setComm(String Comm) {
        this.Comm = Comm;
    }

    public String getDataHora() {
        return DataHora;
    }

    public void setDataHora(String DataHora) {
        this.DataHora = DataHora;
    }

    public String getNick() {
        return Nick;
    }

    public void setNick(String Nick) {
        this.Nick = Nick;
    }

    
    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return Comment_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setNick(stream.readString());
        this.setComm(stream.readString());
        this.setDataHora(stream.readString()); 
    }

    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeString(this.getNick());
        stream.writeString(this.getComm());
        stream.writeString(this.getDataHora()); 
    }


}
