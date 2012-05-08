create or replace
PACKAGE PackLogin IS 

  -- exce��es sem�nticas
  -- exce��o para indicar que a senha do usu�rio est� incorreta
  passwordWrongException EXCEPTION; 

  -- procedimento para verificar username e senha do usu�rio 
  -- caso o usu�rio exista, retorna o valor de seu ID
  -- caso n�o exista, uma exce��o � lan�ada
  PROCEDURE checkLogin(
    Username_t IN Conta.Nick%TYPE,  
    Password_t IN Conta.Senha%TYPE, 
    Id_Usuario OUT Usuario.IdUsuario%TYPE
  ); 
  
END PackLogin; 
/
create or replace
PACKAGE BODY PackLogin IS


  -- implementa��o dos elementos p�blicos
  
  -- verifica��o do login
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
        -- usu�rio n�o encontrado
        RAISE_APPLICATION_ERROR(-20000, 'Usu�rio n�o cadastrado'); 
      WHEN passwordWrongException THEN
        -- usu�rio n�o encontrado
        RAISE_APPLICATION_ERROR(-20001, 'Senha Incorreta'); 
      WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Erro'); 
       
  END checkLogin; 

END PackLogin; 