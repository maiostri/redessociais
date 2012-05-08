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
public class Album_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "ALBUM_T";

    public static final String ORACLE_USER_ARRAY_NAME = "ALBUMS";

    private int IdObjeto;
    private String Nome;
    private String LocalAlbum;
    // deve-se fazer CAST na aplicação para o tipo PHOTO_T
    private byte[] Fotos;

    public Album_t() {
    }

    public Album_t(int IdObjeto, String Nome, String LocalAlbum, byte[] Fotos) {
        this.IdObjeto = IdObjeto;
        this.Nome = Nome;
        this.LocalAlbum = LocalAlbum;
        this.Fotos = Fotos;
    }

    public byte[] getFotos() {
        return Fotos;
    }

    public void setFotos(byte[] Fotos) {
        this.Fotos = Fotos;
    }

    public int getIdObjeto() {
        return IdObjeto;
    }

    public void setIdObjeto(int IdObjeto) {
        this.IdObjeto = IdObjeto;
    }

    public String getLocalAlbum() {
        return LocalAlbum;
    }

    public void setLocalAlbum(String LocalAlbum) {
        this.LocalAlbum = LocalAlbum;
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
        return Album_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setIdObjeto(stream.readInt());
        this.setNome(stream.readString());
        this.setLocalAlbum(stream.readString());
        this.setFotos(stream.readBytes());
    }

    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getIdObjeto());
        stream.writeString(this.getNome());
        stream.writeString(this.getLocalAlbum());
        stream.writeBytes(this.getFotos());
    }

}
