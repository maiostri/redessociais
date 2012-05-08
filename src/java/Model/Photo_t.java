/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.sql.Blob;
import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

/**
 *
 * @author patricio
 */
public class Photo_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "PHOTO_T";

    public static final String ORACLE_USER_ARRAY_NAME = "PHOTOS";

    private int IdObjeto;
    private String Descricao;
    private String Arquivo;
    private Blob Imagem;

    public Photo_t() {
    }

    public Photo_t(int IdObjeto, String Descricao, String Arquivo, Blob Imagem) {
        this.IdObjeto = IdObjeto;
        this.Descricao = Descricao;
        this.Arquivo = Arquivo;
        this.Imagem = Imagem;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    public Blob getImagem() {
        return Imagem;
    }

    public void setImagem(Blob Imagem) {
        this.Imagem = Imagem;
    }

    public int getIdObjeto() {
        return IdObjeto;
    }

    public void setIdObjeto(int IdObjeto) {
        this.IdObjeto = IdObjeto;
    }

    public String getArquivo() {
        return Arquivo;
    }

    public void setArquivo(String Arquivo) {
        this.Arquivo = Arquivo;
    }

    

    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return Photo_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setIdObjeto(stream.readInt());
        this.setDescricao(stream.readString());
        this.setArquivo(stream.readString());
        this.setImagem(stream.readBlob());
    }

    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getIdObjeto());
        stream.writeString(this.getDescricao());
        stream.writeString(this.getArquivo());
        stream.writeBlob(this.getImagem());
    }

}
