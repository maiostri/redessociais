create or replace PACKAGE PackUser IS
  
  --declaraçãoo das exceções semânticas
  -- restrições de integridade dos dados -> violação de chave estrangeira
  fk_exception EXCEPTION; 
  PRAGMA EXCEPTION_INIT(fk_exception, -2291); 
  -- restrição de integridades dos dados -> domínio do atributo sexo
  check_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT(check_exception, -2290);   

  -- procedimentos públicos

  -- procedimento que insere as informações de um usuário e de sua conta no banco de dados
  PROCEDURE insert_user ( 
    nome IN usuario.nome%TYPE, 
    sobrenome IN usuario.sobrenome%TYPE, 
    datanasc IN VARCHAR2, 
    sexo IN usuario.sexo%TYPE,  
    cidadeorigem IN usuario.cidadeorigem%TYPE, 
    paisorigem IN usuario.paisorigem%TYPE,  
    cidadeatual IN usuario.cidadeatual%TYPE, 
    paisatual IN usuario.paisatual%TYPE, 
    tels telefones, 
    ems emails, 
    URL IN conta.URL%TYPE, 
    nick IN conta.nick%TYPE, 
    senha IN conta.senha%TYPE, 
    idusuario usuario.idusuario%TYPE DEFAULT SeqIdUsuario.nextval);    
    
END PackUser; 
/
create or replace
PACKAGE BODY PackUser IS

  -- implementação dos procedimentos públicos
  PROCEDURE insert_user ( 
    nome IN usuario.nome%TYPE, 
    sobrenome IN usuario.sobrenome%TYPE, 
    datanasc IN VARCHAR2, 
    sexo IN usuario.sexo%TYPE,  
    cidadeorigem IN usuario.cidadeorigem%TYPE, 
    paisorigem IN usuario.paisorigem%TYPE,  
    cidadeatual IN usuario.cidadeatual%TYPE, 
    paisatual IN usuario.paisatual%TYPE, 
    tels telefones, 
    ems emails, 
    URL IN conta.URL%TYPE, 
    nick IN conta.nick%TYPE, 
    senha IN conta.senha%TYPE, 
    idusuario usuario.idusuario%TYPE DEFAULT SeqIdUsuario.nextval) IS

  BEGIN  
  
    idusuario := seqidusuario.nextval;  

    --inserção dos dados na tabela USUARIO
    INSERT INTO usuario (idusuario, nome, sobrenome, datanasc, sexo, cidadeorigem, paisorigem, cidadeatual, paisatual, foto) 
      VALUES (idusuario, nome, sobrenome, to_date(datanasc, ' yyyy/mm/dd'), 
        sexo, cidadeorigem, paisorigem, cidadeatual, paisatual, DEFAULT);   

    -- inserção na tabela TELEFONE
    FOR i IN tels.FIRST .. tels.LAST LOOP
      IF tels(i) IS NOT NULL THEN
        INSERT INTO telefone  
          VALUES (tels(i), idusuario);
      END IF; 
    END LOOP; 

    -- inserçãoo na tabela EMAIL
    FOR i IN ems.FIRST .. ems.LAST LOOP
      IF ems(i) IS NOT NULL THEN
        INSERT INTO email  
          VALUES (ems(i), idusuario); 
      END IF; 
    END LOOP; 

    --inserção na tabela CONTA
    INSERT INTO conta 
      VALUES (idusuario, URL, nick, senha, DEFAULT); 

    EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20000, 'Erro: id do usuário já está em uso'); 
      WHEN fk_exception THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: há incosistência nos dados'); 
      WHEN check_exception THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro: sexo deve ser M ou F'); 
      WHEN PROGRAM_ERROR THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro na execução do bloco PL/SQL'); 
      WHEN STORAGE_ERROR THEN
        RAISE_APPLICATION_ERROR(-20004, 'Erro de memória durante a execução do bloco PL/SQL'); 
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20005, 'Erro: código: ' || SQLCODE || ' mensagem: ' || SQLERRM); 

  END insert_user; 
  
END PackUser; 