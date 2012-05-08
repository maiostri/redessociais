create or replace
PACKAGE PackLogin IS 

  -- exceções semânticas
  -- exceção para indicar que a senha do usuário está incorreta
  passwordWrongException EXCEPTION; 

  -- procedimento para verificar username e senha do usuário 
  -- caso o usuário exista, retorna o valor de seu ID
  -- caso não exista, uma exceção é lançada
  PROCEDURE checkLogin(
    Username_t IN Conta.Nick%TYPE,  
    Password_t IN Conta.Senha%TYPE, 
    Id_Usuario OUT Usuario.IdUsuario%TYPE
  ); 
  
END PackLogin; 
/
create or replace
PACKAGE BODY PackLogin IS


  -- implementação dos elementos públicos
  
  -- verificação do login
  PROCEDURE checkLogin(
    Username_t IN Conta.Nick%TYPE, 
    Password_t IN Conta.Senha%TYPE, 
    Id_Usuario OUT Usuario.IdUsuario%TYPE
  ) IS
  
    ps Conta.Senha%TYPE; 
  
  BEGIN
  
    SELECT IdUsuario, Senha INTO Id_Usuario, ps
      FROM Conta
      WHERE Nick = Username_t;    

    IF (ps <> Password_t) THEN
      -- senha incorreta
      RAISE passwordWrongException; 
    END IF; 
      
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN
        -- usuário não encontrado
        RAISE_APPLICATION_ERROR(-20000, 'Usuário não cadastrado'); 
      WHEN passwordWrongException THEN
        -- usuário não encontrado
        RAISE_APPLICATION_ERROR(-20001, 'Senha Incorreta'); 
      WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Erro'); 
       
  END checkLogin; 

END PackLogin; 