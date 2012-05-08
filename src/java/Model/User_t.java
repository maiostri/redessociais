/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.sql.Array;
import java.sql.SQLException;
import java.sql.Blob;
import java.sql.SQLData;
import java.sql.SQLInput;
import java.sql.SQLOutput;

/**
 *
 * @author patricio
 */
public class User_t implements SQLData {

    public static final String ORACLE_OBJECT_NAME = "USER_T";

    public static final String ORACLE_USER_ARRAY_NAME = "USERS";

    private int IdUsuario; 
    private String Nome;
    private String Sobrenome;
    private String DataNasc;
    private String Sexo;
    private String CidadeOrigem;
    private String PaisOrigem;
    private String CidadeAtual;
    private String PaisAtual;
    private Blob Foto;
    private Array Telefones;
    private Array Emails;
    //private ARRAY Telefones;
    //private ARRAY Emails;
    private String URL;
    private String Nick;
    private String Senha;

    public User_t() {
        this.IdUsuario = 0;
        this.Nome = new String();
        this.Sobrenome = new String();
        this.DataNasc = new String();
        this.Sexo = new String();
        this.CidadeOrigem = new String();
        this.PaisOrigem = new String();
        this.CidadeAtual = new String();
        this.PaisAtual = new String();
        this.Foto = null; 
        this.Telefones = null;
        this.Emails = null; 
        this.URL = new String();
        this.Nick = new String();
        this.Senha = new String();
    }


    public User_t(int IdUsuario, String Nome, String Sobrenome, String DataNasc,
            String Sexo, String CidadeOrigem, String PaisOrigem, String CidadeAtual, String PaisAtual, Blob Foto, 
            Array Telefones, Array Emails, String URL, String Nick, String Senha) {
        this.Nome = Nome;
        this.Sobrenome = Sobrenome;
        this.DataNasc = DataNasc;
        this.Sexo = Sexo;
        this.CidadeOrigem = CidadeOrigem;
        this.PaisOrigem = PaisOrigem;
        this.CidadeAtual = CidadeAtual;
        this.PaisAtual = PaisAtual;
        this.Foto = Foto;
        this.Telefones = Telefones;
        this.Emails = Emails;
        this.URL = URL;
        this.Nick = Nick;
        this.Senha = Senha;
    }

    public String getCidadeAtual() {
        return this.CidadeAtual;
    }

    public void setCidadeAtual(String CidadeAtual) {
        this.CidadeAtual = CidadeAtual;
    }

    public String getCidadeOrigem() {
        return this.CidadeOrigem;
    }

    public void setCidadeOrigem(String CidadeOrigem) {
        this.CidadeOrigem = CidadeOrigem;
    }

    public String getDataNasc() {
        return this.DataNasc;
    }

    public void setDataNasc(String DataNasc) {
        this.DataNasc = DataNasc;
    }

    public Array getEmails() {
        //public ARRAY getEmails() {
        return this.Emails;
    }

    public void setEmails(Array Emails) {
        //public void setEmails(ARRAY Emails) {
        this.Emails = Emails;
    }

    public String getNick() {
        return this.Nick;
    }

    public void setNick(String Nick) {
        this.Nick = Nick;
    }

    public String getNome() {
        return this.Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getPaisAtual() {
        return this.PaisAtual;
    }

    public void setPaisAtual(String PaisAtual) {
        this.PaisAtual = PaisAtual;
    }

    public String getPaisOrigem() {
        return this.PaisOrigem;
    }

    public void setPaisOrigem(String PaisOrigem) {
        this.PaisOrigem = PaisOrigem;
    }

    public String getSenha() {
        return this.Senha;
    }

    public void setSenha(String Senha) {
        this.Senha = Senha;
    }

    public String getSexo() {
        return this.Sexo;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    public String getSobrenome() {
        return this.Sobrenome;
    }

    public void setSobrenome(String Sobrenome) {
        this.Sobrenome = Sobrenome;
    }

    public Array getTelefones() {
        //public ARRAY getTelefones() {
        return this.Telefones;
    }

    public void setTelefones(Array Telefones) {
        //public void setTelefones(ARRAY Telefones) {
        this.Telefones = Telefones;
    }

    public String getURL() {
        return this.URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public Blob getFoto() {
        return this.Foto;
    }

    public void setFoto(Blob Foto) {
        this.Foto = Foto;
    }

    public int getIdUsuario() {
        return this.IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    // métodos abstratos

    //Getter retorna o nome do tipo ao JDBC
    public String getSQLTypeName() throws SQLException {
        return User_t.ORACLE_OBJECT_NAME;
    }
    
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.setIdUsuario(stream.readInt()); 
        this.setNome(stream.readString());
        this.setSobrenome(stream.readString());
        this.setDataNasc(stream.readString());
        this.setSexo(stream.readString());
        this.setCidadeOrigem(stream.readString());
        this.setPaisOrigem(stream.readString());
        this.setCidadeAtual(stream.readString());
        this.setPaisAtual(stream.readString());
        this.setFoto(stream.readBlob());
        this.setTelefones(stream.readArray());
        this.setEmails(stream.readArray());
        this.setURL(stream.readString());
        this.setNick(stream.readString());
        this.setSenha(stream.readString());
    }


    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeInt(this.getIdUsuario());
        stream.writeString(this.getNome());
        stream.writeString(this.getSobrenome());
        stream.writeString(this.getDataNasc());
        stream.writeString(this.getSexo());
        stream.writeString(this.getCidadeOrigem());
        stream.writeString(this.getPaisOrigem());
        stream.writeString(this.getCidadeAtual());
        stream.writeString(this.getPaisAtual());
        stream.writeBlob(this.getFoto());
        stream.writeArray(this.getTelefones());
        stream.writeArray(this.getEmails());
        stream.writeString(this.getURL());
        stream.writeString(this.getNick());
        stream.writeString(this.getSenha());
    }
}
