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
 * @author ricardo
 */
public class Group_t implements SQLData {
    public static final String ORACLE_OBJECT_NAME = "GROUP_T";

    public static final String ORACLE_USER_ARRAY_NAME = "GRUPOS";

    private int id_usuario;
    private String Nome;
    private String Sobrenome;
    private String Grupo;

    public Group_t(int id_usuario, String Nome, String Sobrenome, String Grupo) {
        this.id_usuario = id_usuario;
        this.Nome = Nome;
        this.Sobrenome = Sobrenome;
        this.Grupo = Grupo;
    }

    public Group_t() {
    }

    public void setGrupo(String Grupo) {
        this.Grupo = Grupo;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public void setSobrenome(String Sobrenome) {
        this.Sobrenome = Sobrenome;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

  
    public String getGrupo() {
        return Grupo;
    }

    public String getNome() {
        return Nome;
    }

    public String getSobrenome() {
        return Sobrenome;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public String getSQLTypeName() throws SQLException {
        return Group_t.ORACLE_OBJECT_NAME;
    }




    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setId_usuario(stream.readInt());
        this.setNome(stream.readString());
        this.setSobrenome(stream.readString());
        this.setGrupo(stream.readString());
    }


    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getId_usuario());
        stream.writeString(this.getNome());
        stream.writeString(this.getSobrenome());
        stream.writeString(this.getGrupo());
    }



}
