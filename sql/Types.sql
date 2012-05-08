-- criação dos tipos usados para inserir um usuario
-- tipo telefone
CREATE OR REPLACE TYPE Telefones AS TABLE OF VARCHAR2(10); 

-- tipo email
CREATE OR REPLACE TYPE Emails AS TABLE OF VARCHAR2(30); 


-- criação de tipos genericos
-- tipo que representa os dados de um usuário
CREATE OR REPLACE TYPE user_t AS OBJECT(
  id_usuario number, 
  nome varchar2(50),   
  sobrenome varchar2(50), 
  datanasc varchar2(50), 
  sexo varchar2(1), 
  cidadeorigem varchar2(50), 
  paisorigem varchar2(50), 
  cidadeatual varchar2(50), 
  paisatual varchar2(50),
  foto Blob,  
  URL varchar2(50),  
  nick varchar2(50), 
  senha varchar2(50),  
  tels Telefones, 
  ems Emails
); 

-- criação de array de usuários
CREATE OR REPLACE TYPE users IS TABLE OF user_t; 

-- criação do tipo post
create or replace
TYPE post_t AS OBJECT(
  idobjeto NUMBER, 
  conteudo VARCHAR2(50), 
  Linkpost VARCHAR2(50)
);

-- criação do array de posts
create or replace
type Posts as table of post_t;

-- criação do tipo amigo
CREATE OR REPLACE TYPE friend_t AS OBJECT(
  id_usuario NUMBER, 
  nick VARCHAR2(50)
); 

-- criação do tipo de array de amigos
CREATE OR REPLACE TYPE friends IS TABLE OF friend_t; 


--criação do tipo comunidade
CREATE OR REPLACE TYPE community_t IS OBJECT(
  IdDono NUMBER, 
  Nome VARCHAR2(50), 
  Descricao VARCHAR2(50), 
  NMembros NUMBER, 
  Categoria VARCHAR2(50), 
  DataCriacao VARCHAR2(50), 
  Membros users
); 

-- array de comunidades
CREATE OR REPLACE TYPE communitys IS TABLE OF community_t; 


-- dados da página inicial de um comunidade
CREATE OR REPLACE TYPE initial_community_t AS OBJECT(
  IdDono NUMBER, 
  Nome VARCHAR2(50) 
); 

-- array de comunidades da página inicial
CREATE OR REPLACE TYPE initial_communitys IS TABLE OF initial_community_t;  

-- ARRAY de atualizações
CREATE OR REPLACE TYPE updates IS TABLE OF VARCHAR2(255); 


-- criação do tipo Foto (pertencente a álbuns)
CREATE OR REPLACE TYPE photo_t AS OBJECT(
  IdObjeto NUMBER, 
  Descricao VARCHAR(50), 
  Arquivo VARCHAR2(50), 
  Imagem BLOB
); 

-- ARRAY DE fotos
CREATE OR REPLACE TYPE photos IS TABLE OF photo_t; 



-- tipo álbum
CREATE OR REPLACE TYPE Album_t AS OBJECT(
  IdObjeto NUMBER, 
  Nome VARCHAR2(50), 
  LocalAlbum VARCHAR2(50), 
  Fotos Photos    
); 

-- array de álbuns
CREATE OR REPLACE TYPE Albums IS TABLE OF Album_t; 


-- tipo comentário
CREATE OR REPLACE TYPE Comment_t AS OBJECT(
  Nick VARCHAR2(50), 
  Comm VARCHAR2(50), 
  DataHora VARCHAR2(50)
); 

-- array de comentários
CREATE OR REPLACE TYPE Comments IS TABLE OF Comment_t; 

-- arrray de logs (strings)
CREATE OR REPLACE TYPE Logs IS TABLE OF VARCHAR2(50); 

CREATE OR REPLACE TYPE group_t as OBJECT(
  id_usuario NUMBER,
  nome varchar2(50),
  sobrenome varchar2(50),
  grupo varchar2(10)
);

CREATE OR REPLACE TYPE grupos IS TABLE OF group_t;

CREATE OR REPLACE TYPE grupoos IS TABLE OF Varchar2(10);

CREATE OR REPLACE TYPE amigoos IS TABLE OF number;



