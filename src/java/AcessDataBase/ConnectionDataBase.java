/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package AcessDataBase;

import Model.Album_t;
import Model.Comment_t;
import Model.Community_t;
import Model.Friend_t;
import Model.Group_t;
import Model.Initial_Community_t;
import Model.Photo_t;
import Model.Post_t;
import Model.User_t;
import java.sql.CallableStatement;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

/**
 *
 * @author patricio
 */
public class ConnectionDataBase implements Constant {

    private Connection conn;

        // inicialização da conexão com o banco
	public ConnectionDataBase() throws SQLException, ClassNotFoundException {
            Class.forName(driver); // carrega uma classe
            //DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            this.conn = DriverManager.getConnection(url, username, password);

            //Mapeando dos tipos definidos para a aplicação            
            Map<String,Class<?>> typeMaps = this.conn.getTypeMap();

            //mapeamento do tipo usuário
            typeMaps.put(User_t.ORACLE_OBJECT_NAME, User_t.class);
            typeMaps.put(User_t.ORACLE_USER_ARRAY_NAME, User_t[].class);

            //mapeamento do tipo Post
            typeMaps.put(Post_t.ORACLE_OBJECT_NAME, Post_t.class);
            typeMaps.put(Post_t.ORACLE_USER_ARRAY_NAME, Post_t[].class);

            //mapeamento do tipo amigo
            typeMaps.put(Friend_t.ORACLE_OBJECT_NAME, Friend_t.class);
            typeMaps.put(Friend_t.ORACLE_USER_ARRAY_NAME, Friend_t[].class);

            //mapeamento do tipo grupo
            typeMaps.put(Group_t.ORACLE_OBJECT_NAME, Group_t.class);
            typeMaps.put(Group_t.ORACLE_USER_ARRAY_NAME, Group_t[].class);


            //mapeamento do tipo Initial_Community
            typeMaps.put(Initial_Community_t.ORACLE_OBJECT_NAME, Initial_Community_t.class);
            typeMaps.put(Initial_Community_t.ORACLE_USER_ARRAY_NAME, Initial_Community_t[].class);


            //mapeamento do tipo Photo
            typeMaps.put(Photo_t.ORACLE_OBJECT_NAME, Photo_t.class);
            typeMaps.put(Photo_t.ORACLE_USER_ARRAY_NAME, Photo_t[].class);


            //mapeamento do tipo Album
            typeMaps.put(Album_t.ORACLE_OBJECT_NAME, Album_t.class);
            typeMaps.put(Album_t.ORACLE_USER_ARRAY_NAME, Album_t[].class);


            //mapeamento do comentário
            typeMaps.put(Comment_t.ORACLE_OBJECT_NAME, Comment_t.class);
            typeMaps.put(Comment_t.ORACLE_USER_ARRAY_NAME, Comment_t[].class);

            //mapeamento de comunidade
            typeMaps.put(Community_t.ORACLE_OBJECT_NAME, Community_t.class);
            typeMaps.put(Community_t.ORACLE_USER_ARRAY_NAME, Community_t[].class);
	}

        // execução de um comando simples
	public void update(String sql) throws SQLException {
            Statement stmt = this.conn.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
	}

        // execução de uma consulta simples
	public ResultSet query(String sql) throws SQLException {
		Statement stmt = this.conn.createStatement();
		return stmt.executeQuery(sql);
	}

        //encerra a conexão com o banco de dados
	public void close() throws SQLException {
		this.conn.close();
	}

        //prepara uma conexão com um procedimento armazenado
        public CallableStatement prepareStoredProcedure(String SQL) throws SQLException {
            return this.conn.prepareCall(SQL); 
        }

        //realiza uma operação no banco de dados
        public PreparedStatement preparePreparedStatement(String SQL) throws SQLException {
            return this.conn.prepareStatement(SQL); 
        }

        //faz um commit das alterações feitas
        public void commit() throws SQLException {
            this.conn.commit();
        }

        public static void main(String args[]) {

            // teste para a conexão com o banco de dados
            try {
                ConnectionDataBase db = new ConnectionDataBase();
                ResultSet rs = db.query("SELECT Nome FROM Usuario WHERE IdUsuario = 2");
                if (rs.next()) {
                    System.out.println(rs.getString("Nome")); 
                }
                db.close(); 
            }
            catch (ClassNotFoundException ce) {
                ce.printStackTrace();
            }
            catch (SQLException se) {
                se.printStackTrace();
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
}
