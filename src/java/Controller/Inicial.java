/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import Inicial.Community;
import Inicial.Friend;
import Inicial.Group;
import Inicial.Login;
import Inicial.Photo;
import Inicial.Post;
import Inicial.Update;
import Inicial.User; 
import Model.Logs_t;
import Model.User_t;
import java.io.IOException;
import java.sql.SQLException;

/**
 *
 * @author patricio
 */
public class Inicial {

    public Inicial() { }

    //chama o método responável por tratar o login do usuário, dado usename e senha
    public int callCheckLogin(String Username, String Password) throws ClassNotFoundException, SQLException {
        Login cl = new Login();
        return cl.check(Username, Password);
    }

    //chama o método para inserir um novo usuário na rede social
    public void callInsertUser(User_t user) throws ClassNotFoundException, SQLException {
        User u = new User(); 
        u.insertUser(user);
    }

    //chama o método para recuperar os dados iniciais de um usuário na sua página inicial
    public User_t callConsultDataInitial(int v_idusuario) throws ClassNotFoundException, SQLException {
        User u = new User();
        return u.consultDataInitial(v_idusuario);
    }

    //chama o método para atualizar os dados de um usuário
    public void callUpdateUser(User_t user) throws ClassNotFoundException, SQLException {
        User u = new User();
        u.updateUser(user);
    }

    //chama o método para inserir uma foto no perfil de um usuário
    public void callInsertPhotoProfile(int v_idusuario, String pathPhoto) throws SQLException, ClassNotFoundException, IOException {
        Photo p = new Photo();
        p.insertPhotoProfile(v_idusuario, pathPhoto);
    }


    //chama método para recuperar a imagem do profile do usuário
    public byte[] callGetPhotoProfile(int v_idusuario) throws SQLException, ClassNotFoundException {
        return Photo.getPhotoProfile(v_idusuario); 
    }


    //chama o método para recuperar os posts de um usuário
    public Object[] callGetPosts(int v_idusuario) throws SQLException, ClassNotFoundException {
        Post p = new Post();
        return p.getPosts(v_idusuario);
    }

    //recupera as informações iniciais dos amigos de um usuário
    public Object[] callGetFriends(int id_usuario) throws SQLException, ClassNotFoundException {
        Friend f = new Friend();
        return f.getFriends(id_usuario); 
    }

    //recupera as informações das comundiades de um usuário
    public Object[] callGetInitialCommunity(int id_usuario) throws SQLException, ClassNotFoundException {
        Community c = new Community();
        return c.getInitialCommunities(id_usuario); 
    }

    //recupera as atualizações de um usuário
    public Object[] callGetUpdates(int id_usuario) throws SQLException, ClassNotFoundException {
        Update u = new Update();
        return u.getUpdates(id_usuario); 
    }

    //atualiza a senha de um usuário
    public void callAlterSenha(int v_idusuario, String new_senha) throws SQLException, ClassNotFoundException {
        User u = new User();
        u.alterSenha(v_idusuario, new_senha); 
    }

    //atualiza o nick de um usuário
    public void callAlterNick(int v_idusuario, String new_nick) throws SQLException, ClassNotFoundException {
        User u = new User();
        u.alterNick(v_idusuario, new_nick);  
    }

    // recupera os álbums de um usuário
    public Object[] callGetAlbums(int v_idusuario) throws SQLException, ClassNotFoundException {
        return Photo.getAlbums(v_idusuario);
    }

    // recupera os comentários de um álbum
    public Object[] callGetCommentAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        return Photo.getCommentAlbum(v_idobjeto); 
    }
    
    // recupera as fotos de um álbum
    public Object[] callGetPhotosAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        return Photo.getPhotosAlbum(v_idobjeto);  
    }

    // recupera as fotos de um álbum
    public byte[] callGetPhoto(int v_idobjeto) throws SQLException, ClassNotFoundException {
        return Photo.getPhoto(v_idobjeto); 
    }

    // recupera as fotos de um álbum
    public int callGetNCommentsAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        return Photo.getNCommentsAlbum(v_idobjeto);
    }

    //retorna o número de fotos de um álbum
    public int callGetNPhotosAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        return Photo.getNPhotosAlbum(v_idobjeto);
    }

    // insere um álbum
    public static void callInsertAlbum(int v_idusuario, String NomeAlbum, String LocalAlbum) throws SQLException, ClassNotFoundException {
        Photo.insertAlbum(v_idusuario, NomeAlbum, LocalAlbum);
    }

    // remove um álbum
    public static void callRemoveAlbum(int v_idobjeto) throws SQLException, ClassNotFoundException {
        Photo.removeAlbum(v_idobjeto); 
    }

    // adiciona um comentário a um álbum
    public static void callInsertCommentAlbum(int v_idusuario, int v_idobjeto, String Conteudo, String LinkPost) throws SQLException, ClassNotFoundException {
        Photo.insertCommentAlbum(v_idusuario, v_idobjeto, Conteudo, LinkPost); 
    }

    // adiciona uma foto em um álbum
    public static void callInsertPhotoAlbum(int v_idusuario, int v_idalbum, String Arquivo, String Descricao) throws ClassNotFoundException, SQLException, IOException {
        Photo.insertPhotoAlbum(v_idusuario, v_idalbum, Arquivo, Descricao);
    }
    
    // adiciona uma foto em um álbum
    public static void callRemovePhotoALbum(int v_idfoto, int v_idalbum) throws ClassNotFoundException, SQLException {
        Photo.removePhotoAlbum(v_idfoto, v_idalbum); 
    }

    //insere um post
    public static void callInsertPost(int v_idusuario, String LinkPost, String Conteudo) throws SQLException, ClassNotFoundException {
        Post.insertPost(v_idusuario, LinkPost, Conteudo); 
    }


    //remove um post
    public static void callRemovePost(int v_idPost) throws SQLException, ClassNotFoundException {
        Post.removePost(v_idPost);
    }


    //insere um comentário em um post
    public static void callInsertCommentPost(int v_idusuario, int v_idobjeto, String Conteudo, String LinkPost) throws SQLException, ClassNotFoundException {
        Post.insertCommentPost(v_idusuario, v_idobjeto, Conteudo, LinkPost);
    }

    // retorna as comunidades de um usuário
    public static Object[] callGetCommunities(int v_idusuario) throws SQLException, ClassNotFoundException {
        return Community.getCommunities(v_idusuario);
    }

    // retorna os usuários de uma comunidade
    public static Object[] callGetUsersCommunities(int v_idusuario, String NomeComunidade) throws SQLException, ClassNotFoundException {
        return Community.getUsersCommunities(v_idusuario, NomeComunidade);
    }

    //atualiza os dados de uma comunidade
    public static void callUpdateCommunity(int v_idusuario, String NomeComunidade, String Descricao, String Categoria) throws SQLException, ClassNotFoundException {
        Community.updateCommunity(v_idusuario, NomeComunidade, Descricao, Categoria);
    }


    //insere os dados de uma comunidade
    public static void callInsertCommunity(int v_idusuario, String NomeComunidade, String Descricao, String Categoria) throws SQLException, ClassNotFoundException {
        Community.insertCommunity(v_idusuario, NomeComunidade, Descricao, Categoria);
    }

    //remove os dados de uma comunidade
    public static void callRemoveCommunity(int v_idusuario, String NomeComunidade) throws SQLException, ClassNotFoundException {
        Community.removeCommunity(v_idusuario, NomeComunidade);
    }

    //insere as informações de acesso de um usuário
     public static void callLog(int v_idusuario, String DataIn) throws ClassNotFoundException, SQLException {
         Login.log(v_idusuario, DataIn);
     }

     //retorna o log de entrada/saída de um usuário
    public static Logs_t callGetLogs(int v_idusuario) throws ClassNotFoundException, SQLException {
        return Login.getLogs(v_idusuario);
    }

    // retorna as comunidades de um usuário
    public static Object[] callGetCommunitiesP(int v_idusuario) throws SQLException, ClassNotFoundException {
        return Community.getCommunitiesP(v_idusuario);
    }


    public Object[] callGetGroups(int id_usuario) throws SQLException, ClassNotFoundException {
        Group g = new Group();
        return g.getGroups(id_usuario);
    }

    public void callRemoveFriend(int id_usuario, int id_amigo) throws SQLException, ClassNotFoundException {
        Friend f = new Friend();
        f.removeFriend(id_usuario, id_amigo);
    }

    public void callChangeGroup(int v_idusuario, int v_amigo, String grupo) throws SQLException, ClassNotFoundException {
        Group g = new Group();
        g.changeGroup(v_idusuario, v_amigo, grupo);
    }

    public Object[] callGetGroupsUser(int v_idusuario) throws SQLException, ClassNotFoundException {
        Group g = new Group();
        return g.getGroupsUser(v_idusuario);
    }

    public void callInsertGroup(int v_idusuario, String grupo) throws SQLException, ClassNotFoundException {
        Group g = new Group();
        g.createGroup(v_idusuario, grupo);
    }

    public static void callExitCommunity(int v_idusuario, int v_idusuariocom, String Nome) throws SQLException, ClassNotFoundException {
        Community.exitCommunity(v_idusuario, v_idusuariocom, Nome);
    }

    public Object[] callgetCommentPost(int v_post) throws SQLException, ClassNotFoundException {
        Post p = new Post();
        return p.getCommentPost(v_post);
    }
}
