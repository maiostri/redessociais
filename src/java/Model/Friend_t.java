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
public class Friend_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "FRIEND_T";

    public static final String ORACLE_USER_ARRAY_NAME = "FRIENDS";

    private int id_usuario;
    private String Nick;

    public Friend_t(int id_usuario, String Nick) {
        this.id_usuario = id_usuario;
        this.Nick = Nick;
    }

    public Friend_t() {
    }

    public String getNick() {
        return Nick;
    }

    public void setNick(String Nick) {
        this.Nick = Nick;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return Friend_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setId_usuario(stream.readInt());
        this.setNick(stream.readString());
    }


    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getId_usuario());
        stream.writeString(this.getNick());
    }

}