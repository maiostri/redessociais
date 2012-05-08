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
public class Initial_Community_t implements SQLData {

    private int IdDono;
    private String Nome;

    public static final String ORACLE_OBJECT_NAME = "INITIAL_COMMUNITY_T";

    public static final String ORACLE_USER_ARRAY_NAME = "INITIAL_COMMUNITYS";


    public Initial_Community_t() {
    }

    public Initial_Community_t(int IdDono, String Nome) {
        this.IdDono = IdDono;
        this.Nome = Nome;
    }

    public int getIdDono() {
        return IdDono;
    }

    public void setIdDono(int IdDono) {
        this.IdDono = IdDono;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return Initial_Community_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setIdDono(stream.readInt());
        this.setNome(stream.readString());
    }


    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getIdDono());
        stream.writeString(this.getNome());
    }

}
