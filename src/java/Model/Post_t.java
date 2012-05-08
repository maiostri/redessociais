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
public class Post_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "POST_T";

    public static final String ORACLE_USER_ARRAY_NAME = "POSTS"; 

    private int IdObjeto;
    private String Conteudo;
    private String LinkPost; 

    public Post_t() {
    }

    public Post_t(int IdObjeto, String Conteudo, String LinkPost) {
        this.IdObjeto = IdObjeto;
        this.Conteudo = Conteudo;
        this.LinkPost = LinkPost;
    }

    public String getConteudo() {
        return Conteudo;
    }

    public void setConteudo(String Conteudo) {
        this.Conteudo = Conteudo;
    }

    public int getIdObjeto() {
        return IdObjeto;
    }

    public void setIdObjeto(int IdObjeto) {
        this.IdObjeto = IdObjeto;
    }

    public String getLinkPost() {
        return LinkPost;
    }

    public void setLinkPost(String LinkPost) {
        this.LinkPost = LinkPost;
    }

    

    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return Post_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setIdObjeto(stream.readInt());
        this.setConteudo(stream.readString());
        this.setLinkPost(stream.readString()); 
    }


    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getIdObjeto());
        stream.writeString(this.getConteudo());
        stream.writeString(this.getLinkPost()); 
    }
}
