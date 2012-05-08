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
public class Community_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "COMMUNITY_T";

    public static final String ORACLE_USER_ARRAY_NAME = "COMMUNITYS";

    private int IdDono;
    private String Nome;
    private String Descricao;
    private int NMembros;
    private String Categoria;
    private String DataCriacao; 
    private Array Membros;

    public Community_t() {
    }

    public Community_t(int IdDono, String Nome, String Descricao, int NMembros, String Categoria, String DataCriacao, Array Membros) {
        this.IdDono = IdDono;
        this.Nome = Nome;
        this.Descricao = Descricao;
        this.NMembros = NMembros;
        this.Categoria = Categoria;
        this.Membros = Membros;
        this.DataCriacao = DataCriacao; 
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    public int getIdDono() {
        return IdDono;
    }

    public void setIdDono(int IdDono) {
        this.IdDono = IdDono;
    }

    public Array getMembros() {
        return Membros;
    }

    public void setMembros(Array Membros) {
        this.Membros = Membros;
    }

    public int getNMembros() {
        return NMembros;
    }

    public void setNMembros(int NMembros) {
        this.NMembros = NMembros;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getDataCriacao() {
        return DataCriacao;
    }

    public void setDataCriacao(String DataCriacao) {
        this.DataCriacao = DataCriacao;
    }
    

    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return Friend_t.ORACLE_OBJECT_NAME;
    }

    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setIdDono(stream.readInt());
        this.setNome(stream.readString());
        this.setDescricao(stream.readString());
        this.setNMembros(stream.readInt());
        this.setCategoria(stream.readString());
        this.setDataCriacao(stream.readString()); 
        this.setMembros(stream.readArray());
    }


    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getIdDono());
        stream.writeString(this.getNome());
        stream.writeString(this.getDescricao());
        stream.writeInt(this.getNMembros());
        stream.writeString(this.getCategoria());
        stream.writeString(this.getDataCriacao());
        stream.writeArray(this.getMembros()); 
    }
    
}
