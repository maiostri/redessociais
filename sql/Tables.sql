
--CRIACAO SEQUENCIA para o id das atualizações 
CREATE SEQUENCE SeqIdAtualizacoes 
      INCREMENT BY 1  
      START WITH 1    
      MINVALUE   0
      NOCACHE         
      NOCYCLE; 

-- tabela que conterá as informações sobre as atualizações
CREATE TABLE Atualizacoes(
    IdAtualizacao NUMBER NOT NULL,  
    DataHoraAtualizacao DATE NOT NULL,  
    IdDonoAtualizacao NUMBER NOT NULL, 
    IdAmizade NUMBER, 
    Mensagem VARCHAR2(255) NOT NULL, 
    
    CONSTRAINT pk_atualizacoes PRIMARY KEY(IdAtualizacao)
); 

-- tabela temporária na qual serão inseridas todas as fotos. A inserção nesta tabela deve disparar um trigger para inserir
-- na tabela atualizacao e para inserir as informações na tabela foto
CREATE GLOBAL TEMPORARY TABLE FOTO_TEMP( 
  IdObjeto NUMBER, 
  Descricao VARCHAR2(50), 
  Arquivo VARCHAR2(50), 
  Foto BLOB, 
  Album NUMBER
) ON COMMIT DELETE ROWS; 


-- tabela temporária na qual serão inseridas todas os álbuns. A inserção nesta tabela deve disparar um trigger para inserir
-- na tabela atualizacao e para inserir as informações na tabela album
CREATE GLOBAL TEMPORARY TABLE ALBUM_TEMP( 
  IdObjeto NUMBER, 
  Nome VARCHAR2(50), 
  LocalAlbum VARCHAR2(50), 
  NFotos NUMBER
) ON COMMIT DELETE ROWS; 


-- tabela temporária na qual serão inseridas todas os álbuns. A inserção nesta tabela deve disparar um trigger para inserir
-- na tabela atualizacao e para inserir as informações na tabela album
CREATE GLOBAL TEMPORARY TABLE POST_TEMP( 
  IdObjeto NUMBER, 
  LinkPost VARCHAR2(50), 
  Conteudo VARCHAR2(50)
) ON COMMIT DELETE ROWS; 


-- tabela temporária na qual serão inseridas as informações das amizades. Após uma inserção nesta tabela, um trigger é disparado
-- no qual ocorrem nele as devidas inserções nas tabelas amizades, grupo e compoe. Além disso, ocorre a inserção na tabela Atualização
CREATE GLOBAL TEMPORARY TABLE Amizade_temp (
  idamizade NUMBER, 
  mensagem VARCHAR2(100), 
  remetente NUMBER, 
  destinatario NUMBER, 
  dataami DATE
) ON COMMIT DELETE ROWS;