--CRIACAO SEQUENCIA SegIdUsuario 
CREATE SEQUENCE SeqIdUsuario 
      INCREMENT BY 1  
      START WITH 1    
      MINVALUE   0
      NOCACHE         
      NOCYCLE; 

--CRIACAO SEQUENCIA SeqIdObjeto 
CREATE SEQUENCE SeqIdObjeto                         
      INCREMENT BY 1                             
      START WITH 1                              
      MINVALUE   0
      NOCACHE                                    
      NOCYCLE; 

--CRIACAO SEQUENCIA SeqIdAmizade 
CREATE SEQUENCE SeqIdAmizade                         
      INCREMENT BY 1                             
      START WITH 1                               
      MINVALUE   0
      --MAXVALUE   99999                           
      NOCACHE                                    
      NOCYCLE;

--Criação das Tabelas      
CREATE TABLE Usuario (
  IdUsuario	NUMBER NOT NULL,
  Nome    	VARCHAR2(50) NOT NULL,
  Sobrenome 	VARCHAR2(50) NOT NULL,
  DataNasc	DATE NOT NULL,
  Sexo		VARCHAR2(1) NOT NULL,  
  CidadeOrigem  VARCHAR2(50),
  PaisOrigem	VARCHAR2(50),
  CidadeAtual	VARCHAR2(50),
  PaisAtual	VARCHAR2(50),
  Foto		BLOB DEFAULT EMPTY_BLOB() NOT NULL,
  CONSTRAINT PK_Usuario PRIMARY KEY (IdUsuario),
  CONSTRAINT CK_Usuario_Sexo CHECK (Sexo IN ('M', 'F'))
); 

CREATE TABLE Telefone (
  Telefone	VARCHAR2(10) NOT NULL,
  IdUsuario	NUMBER NOT NULL,
  CONSTRAINT PK_Telefone PRIMARY KEY (Telefone, IdUsuario),
  CONSTRAINT FK_Telefone_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE
); 

CREATE TABLE Email (
  Email		VARCHAR2(30) NOT NULL,
  IdUsuario	NUMBER NOT NULL,
  CONSTRAINT PK_Email PRIMARY KEY (Email, IdUsuario),
  CONSTRAINT FK_Email_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE
); 

CREATE TABLE Amizade (
  IdAmizade	NUMBER NOT NULL,
  Mensagem    	VARCHAR2(100) NOT NULL,
  Remetente	NUMBER NOT NULL,
  Destinatario	NUMBER NOT NULL,
  Data		DATE,
  CONSTRAINT PK_Amizade PRIMARY KEY (IdAmizade),
  CONSTRAINT UK_Amizade_Remetente_Dest UNIQUE (Remetente, Destinatario),
  CONSTRAINT FK_Amizade_Remetente FOREIGN KEY (Remetente) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE,
  CONSTRAINT FK_Amizade_Destinatario FOREIGN KEY (Destinatario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE
); 

CREATE TABLE Grupo (
  IdUsuario	NUMBER NOT NULL,
  Nome    	VARCHAR2(10) NOT NULL,
  NMembros 	NUMBER DEFAULT 1,
  CONSTRAINT PK_Grupo PRIMARY KEY (IdUsuario, Nome),  
  CONSTRAINT FK_Grupo_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE
); 

CREATE TABLE Compoe (
  IdUsuario	NUMBER NOT NULL,
  Grupo    	VARCHAR2(10) NOT NULL,
  IdAmizade	NUMBER NOT NULL,
  CONSTRAINT PK_Compoe PRIMARY KEY (IdUsuario, Grupo, IdAmizade),  
  CONSTRAINT FK_Compoe_IdUsuario_Grupo FOREIGN KEY (IdUsuario, Grupo) REFERENCES Grupo(IdUsuario, Nome) ON DELETE CASCADE,
  CONSTRAINT FK_Compoe_IdAmizade FOREIGN KEY (IdAmizade) REFERENCES Amizade(IdAmizade) ON DELETE CASCADE
); 

CREATE TABLE Conta (
  IdUsuario	NUMBER NOT NULL,
  URL    	VARCHAR2(50) NOT NULL,
  Nick	 	VARCHAR2(50) NOT NULL,
  Senha		VARCHAR2(50) NOT NULL,
  DataCriacao	DATE DEFAULT SYSDATE,
  CONSTRAINT PK_Conta PRIMARY KEY (IdUsuario),
  CONSTRAINT UK_Conta_URL UNIQUE (URL),
  CONSTRAINT UK_Conta_Nick UNIQUE (Nick),
  CONSTRAINT FK_Conta_Usuario FOREIGN KEY  (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE
); 

CREATE TABLE Acesso (
  DataIn	DATE DEFAULT SYSDATE,
  DataOut	DATE NOT NULL,
  IdUsuario	NUMBER NOT NULL,
  CONSTRAINT PK_Acesso PRIMARY KEY (DataIn, IdUsuario),
  CONSTRAINT FK_Acesso_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE,
  CONSTRAINT CK_Acesso_Data CHECK (DataIn < DataOut)
); 

CREATE TABLE Comunidade (
  IdUsuario	NUMBER NOT NULL,
  Nome    	VARCHAR2(50) NOT NULL,
  Descricao 	VARCHAR2(50),
  NMembros	NUMBER DEFAULT 1,
  DataCriacao	DATE DEFAULT SYSDATE,
  CONSTRAINT PK_Comunidade PRIMARY KEY (IdUsuario, Nome),
  CONSTRAINT FK_Comunidade_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE
); 

CREATE TABLE Participa (
  Participante	NUMBER NOT NULL,
  IdUsuario	NUMBER NOT NULL,
  Comunidade   	VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_Participa PRIMARY KEY (Participante, IdUsuario, Comunidade),
  CONSTRAINT FK_Participante_Participante FOREIGN KEY (Participante) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE,
  CONSTRAINT FK_Participante_IdUsuario_Com FOREIGN KEY (IdUsuario, Comunidade) REFERENCES Comunidade(IdUsuario, Nome) ON DELETE CASCADE
);

CREATE TABLE Categoria (
  Categoria	VARCHAR2(30) NOT NULL,
  IdUsuario	NUMBER NOT NULL,
  Comunidade	VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_Categoria PRIMARY KEY (Categoria, IdUsuario, Comunidade),
  CONSTRAINT FK_Categoria_Comunidade FOREIGN KEY (IdUsuario, Comunidade) REFERENCES Comunidade(IdUsuario, Nome) ON DELETE CASCADE
); 

CREATE TABLE Objeto (
  IdObjeto	NUMBER NOT NULL,
  Tipo		VARCHAR2(1) NOT NULL,
  DataCriacao	DATE DEFAULT SYSDATE,
  Comunidade 	VARCHAR2(50),
  DonoComunidade NUMBER,
  IdUsuario	NUMBER,
  CONSTRAINT PK_Objeto PRIMARY KEY (IdObjeto),  
  CONSTRAINT FK_Objeto_Comunidade FOREIGN KEY (DonoComunidade, Comunidade) REFERENCES Comunidade(IdUsuario, Nome) ON DELETE CASCADE,
  CONSTRAINT FK_Objeto_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE,
  CONSTRAINT CK_Objeto_Tipo CHECK (Tipo IN ('F', 'A', 'P'))
);

CREATE TABLE Interage (
  IdUsuario	NUMBER NOT NULL,
  Grupo 	VARCHAR2(10) NOT NULL,
  IdObjeto	NUMBER NOT NULL,
  Permissao 	VARCHAR(1) DEFAULT 'V',
  CONSTRAINT PK_Interage PRIMARY KEY (IdUsuario, Grupo, IdObjeto),  
  CONSTRAINT FK_Interage_IdUsuario_G FOREIGN KEY  (IdUsuario, Grupo) REFERENCES Grupo(IdUsuario, Nome) ON DELETE CASCADE,
  CONSTRAINT FK_Interage_IdObjeto FOREIGN KEY  (IdObjeto) REFERENCES Objeto(IdObjeto) ON DELETE CASCADE
); 

CREATE TABLE Album (
  IdObjeto	NUMBER NOT NULL,
  Nome    	VARCHAR2(50) NOT NULL,
  LocalAlbum 	VARCHAR2(50) NOT NULL,
  NFotos	NUMBER DEFAULT 0,
  CONSTRAINT PK_Album PRIMARY KEY (IdObjeto),
  CONSTRAINT FK_Album_Objeto FOREIGN KEY (IdObjeto) REFERENCES Objeto(IdObjeto) ON DELETE CASCADE
);

CREATE TABLE Foto (
  IdObjeto	NUMBER NOT NULL,
  Descricao    	VARCHAR2(50) NOT NULL,
  Arquivo    	VARCHAR2(50) NOT NULL,
  Imagem	BLOB DEFAULT EMPTY_BLOB(),
  Album		NUMBER NOT NULL,
  CONSTRAINT PK_Foto PRIMARY KEY (IdObjeto),  
  CONSTRAINT FK_Foto_Album FOREIGN KEY (Album) REFERENCES Album(IdObjeto) ON DELETE CASCADE,
  CONSTRAINT FK_Foto_Objeto FOREIGN KEY (IdObjeto) REFERENCES Objeto(IdObjeto) ON DELETE CASCADE
);

CREATE TABLE Post (
  IdObjeto	NUMBER NOT NULL,
  LinkPost    	VARCHAR2(50) NOT NULL,
  Conteudo    	VARCHAR2(50) NOT NULL,
  CONSTRAINT PK_Post PRIMARY KEY (IdObjeto),  
  CONSTRAINT FK_Post_Objeto FOREIGN KEY (IdObjeto) REFERENCES Objeto(IdObjeto) ON DELETE CASCADE
);

CREATE TABLE Comentario (
  Remetente	NUMBER NOT NULL,
  Post    	NUMBER NOT NULL,
  IdObjeto    	NUMBER NOT NULL,
  CONSTRAINT PK_Comentario PRIMARY KEY (Post),  
  CONSTRAINT FK_Comentario_Rementente FOREIGN KEY (Remetente) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE,
  CONSTRAINT FK_Comentario_Post FOREIGN KEY (Post) REFERENCES Objeto(IdObjeto) ON DELETE CASCADE,
  CONSTRAINT FK_Comentario_IdObjeto FOREIGN KEY (IdObjeto) REFERENCES Objeto(IdObjeto) ON DELETE CASCADE
);

