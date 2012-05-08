create or replace
PACKAGE PackUser IS
  
  --declaração das exceções semânticas
  -- restrições de integridade dos dados -> violação de chave estrangeira
  fk_exception EXCEPTION; 
  PRAGMA EXCEPTION_INIT(fk_exception, -2291); 
  -- restrição de integridades dos dados -> domínio do atributo sexo
  check_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT(check_exception, -2290);   

  -- procedimentos públicos

  -- procedimento que insere as informações de um usuário e de sua conta no banco de dados
  PROCEDURE insert_user ( 
    user_data IN OUT user_t);    
    
  -- procedimento para recuperar os dados da página inicial do usuário
  PROCEDURE consult_data_user(
    v_idusuario IN Usuario.IdUsuario%TYPE,  
    user_data OUT user_t 
  ); 
  
  --procedimento de atualização dos dados de um usuário
  PROCEDURE update_data_user(
    user_data IN user_t
  ); 
  
  -- atualiza a senha
  PROCEDURE update_password(
    v_idusuario Conta.idusuario%TYPE, 
    new_password Conta.Senha%TYPE
  );
  
  -- atualiza o nick de acesso
  PROCEDURE update_nick(
    v_idusuario IN Conta.idusuario%TYPE, 
    new_nick IN Conta.Nick%TYPE
  );
    
END PackUser;
/
create or replace
PACKAGE BODY PackUser IS

  -- implementação dos procedimentos públicos
  PROCEDURE insert_user ( 
    user_data IN OUT user_t) IS 

  BEGIN

    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;  
    
    --user_data.id_usuario := SeqIdUsuario.nextval; 

    --inserção dos dados na tabela USUARIO
    INSERT INTO usuario (idusuario, nome, sobrenome, datanasc, sexo, cidadeorigem, paisorigem, cidadeatual, paisatual, foto) 
      VALUES (SeqIdUsuario.nextval, user_data.nome, user_data.sobrenome, to_date(user_data.datanasc, ' yyyy/mm/dd'), 
        user_data.sexo, user_data.cidadeorigem, user_data.paisorigem, user_data.cidadeatual, user_data.paisatual, DEFAULT);   

    -- inserção na tabela TELEFONE
    FOR i IN user_data.tels.FIRST .. user_data.tels.LAST LOOP
        IF user_data.tels(i) IS NOT NULL THEN
          INSERT INTO telefone  
            VALUES (user_data.tels(i), SeqIdUsuario.currVal);
        END IF; 
    END LOOP; 

    -- inserção na tabela EMAIL
    FOR i IN user_data.ems.FIRST .. user_data.ems.LAST LOOP
        IF user_data.ems(i) IS NOT NULL THEN
          INSERT INTO email  
            VALUES (user_data.ems(i), SeqIdUsuario.currVal); 
        END IF; 
    END LOOP; 

    --inserção na tabela CONTA
    INSERT INTO conta 
      VALUES (SeqIdUsuario.currVal, user_data.URL, user_data.nick, user_data.senha, DEFAULT); 
      
    COMMIT; 

    EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20000, 'Erro: id do usu¿rio j¿ est¿ em uso'); 
      WHEN fk_exception THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: h¿ incosist¿ncia nos dados'); 
      WHEN check_exception THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erro: sexo deve ser M ou F'); 
      WHEN PROGRAM_ERROR THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro na execu¿¿o do bloco PL/SQL'); 
      WHEN STORAGE_ERROR THEN
        RAISE_APPLICATION_ERROR(-20004, 'Erro de mem¿ria durante a execu¿¿o do bloco PL/SQL'); 
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20005, 'Erro: c¿digo: ' || SQLCODE || ' mensagem: ' || SQLERRM); 
        
      SELECT SeqIdUsuario.currVal INTO user_data.id_usuario
          FROM DUAL; 

  END insert_user; 
  
  
   -- procedimento para recuperar os dados da página inicial do usuário
  PROCEDURE consult_data_user(
    v_idusuario IN Usuario.IdUsuario%TYPE,  
    user_data OUT user_t 
  ) IS
  
    temp DATE; 
  
  
  BEGIN 
  
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;  
    
    user_data := user_t(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null); 
    
    SELECT U.nome, U.sobrenome, U.sexo, U.cidadeorigem, U.paisorigem, U.cidadeatual, U.paisatual, U.foto
      INTO user_data.nome, user_data.sobrenome, user_data.sexo, user_data.cidadeorigem, user_data.paisorigem, 
            user_data.cidadeatual, user_data.paisatual, user_data.foto 
      FROM Usuario U 
      WHERE U.idusuario = v_idusuario;   
      
    SELECT U.datanasc INTO temp FROM Usuario U WHERE U.idusuario = v_idusuario; 
    
    user_data.datanasc := to_char(temp, 'dd/mm/yyyy');  
      
    SELECT Co.URL, Co.Nick, Co.Senha
      INTO user_data.URL, user_data.Nick, user_data.Senha
      FROM Conta Co 
      WHERE Co.idusuario = v_idusuario; 
      
      --retornar os dados de telefone e email do usuário em um array por meio do select
    SELECT T.telefone 
      BULK COLLECT INTO user_data.tels
      FROM Telefone T
      WHERE T.idusuario = v_idusuario; 
      
    SELECT E.email 
      BULK COLLECT INTO user_data.ems
      FROM Email E
      WHERE E.idusuario = v_idusuario; 
    
    
    COMMIT; 
    
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Usuário não encontrado'); 
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: c¿digo: ' || SQLCODE || ' mensagem: ' || SQLERRM); 
  
  END consult_data_user;  
  
  
  PROCEDURE update_data_user(
    user_data IN user_t
  ) IS
  
    temp DATE; 
    
    CURSOR tel IS SELECT T.telefone FROM telefone T WHERE T.idusuario = user_data.id_usuario FOR UPDATE OF T.telefone;   
    v_tel tel%ROWTYPE;  
    
    CURSOR eml IS SELECT E.email FROM Email E WHERE E.idusuario = user_data.id_usuario FOR UPDATE OF E.email;   
    v_eml eml%ROWTYPE;  
    
    cont NUMBER := 1; 
  
  BEGIN
  
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
    
    temp := to_date(user_data.datanasc, 'yyyy/mm/dd'); 
    
    UPDATE Usuario 
      SET nome = user_data.nome, sobrenome = user_data.sobrenome, datanasc = temp, sexo = user_data.sexo, 
        cidadeorigem = user_data.cidadeorigem, paisorigem = user_data.paisorigem, cidadeatual = user_data.cidadeatual, 
        paisatual = user_data.paisatual
      WHERE idusuario = user_data.id_usuario; 
      
    UPDATE Conta
      SET URL = user_data.URL
      WHERE idusuario = user_data.id_usuario; 
      
    
    OPEN tel;
    
    LOOP
      FETCH tel INTO v_tel; 
      EXIT WHEN tel%NOTFOUND; 
      
      IF (cont <= user_data.tels.count) THEN
        UPDATE Telefone T SET T.Telefone = user_data.tels(cont) WHERE CURRENT OF tel;
      ELSIF (cont > user_data.tels.count) THEN
        DELETE FROM Telefone t WHERE CURRENT OF tel;
      END IF;      
      cont := cont + 1; 
    END LOOP; 
    
    IF ((cont - 1) < user_data.tels.count) THEN
      FOR loop_counter IN (cont)..(user_data.tels.count) LOOP
          INSERT INTO Telefone(Telefone, IdUsuario) VALUES (user_data.tels(loop_counter), user_data.id_usuario);
      END LOOP;
    END IF; 
    
    CLOSE tel; 
    
    
    cont := 1; 
    
    OPEN eml; 
    
    LOOP
      FETCH eml INTO v_eml; 
      EXIT WHEN eml%NOTFOUND; 
      
      IF (cont <= user_data.ems.count) THEN
        UPDATE Email E SET E.Email = user_data.ems(cont) WHERE CURRENT OF eml;
      ELSIF (cont > user_data.ems.count) THEN
        DELETE FROM Email E WHERE CURRENT OF eml;
      END IF;      
      cont := cont + 1; 
    END LOOP; 
    
    IF ((cont - 1) < user_data.ems.count) THEN
      FOR loop_counter2 IN (cont)..(user_data.ems.count) LOOP
          INSERT INTO Email(Email, IdUsuario) VALUES (user_data.ems(loop_counter2), user_data.id_usuario);
      END LOOP;
    END IF; 
    
    CLOSE eml; 
    
    
    COMMIT; 
    
    
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20000, 'Erro');  
  
  END update_data_user; 
  
  
  -- atualiza a senha
  PROCEDURE update_password(
    v_idusuario IN Conta.idusuario%TYPE, 
    new_password IN Conta.Senha%TYPE
  ) IS 
  
  BEGIN
    
    UPDATE Conta 
      SET senha = new_password
      WHERE idusuario = v_idusuario;  
    
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20000, 'Erro');  
  
  END update_password;
   
  -- atualiza o nick de acesso
  PROCEDURE update_nick(
    v_idusuario IN Conta.idusuario%TYPE, 
    new_nick IN Conta.Nick%TYPE
  ) IS
  
  BEGIN 
    
    UPDATE Conta
      SET nick = new_nick
      WHERE idusuario = v_idusuario; 
    
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20000, 'Erro');  
  
  END update_nick;
  
END PackUser;