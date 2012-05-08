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
  
  -- faz o registro de entrada e saída do usuário
  PROCEDURE insertAcces(v_idusuario IN acesso.IdUsuario%TYPE, DataHoraIn IN VARCHAR2); 
  
  --recupera todos os logs de entrada/saída de um usuário
  PROCEDURE getLogs(v_idusuario IN acesso.IdUsuario%TYPE, LogEntrada OUT Logs, LogSaida OUT Logs); 
  
  
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
        -- senha incorreta
        RAISE_APPLICATION_ERROR(-20001, 'Senha Incorreta'); 
      WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Erro'); 
       
  END checkLogin; 
  
  
  
  PROCEDURE insertAcces(v_idusuario IN acesso.IdUsuario%TYPE, DataHoraIn IN VARCHAR2) IS
  
    BEGIN
      
      INSERT INTO Acesso(DataIn, DataOut, IdUsuario) VALUES (TO_DATE(DataHoraIn, 'dd/mm/yyyy hh24:mi:ss'), SYSDATE, v_idusuario); 
      
    END insertAcces; 
    
    
  PROCEDURE getLogs(v_idusuario IN acesso.IdUsuario%TYPE, LogEntrada OUT Logs, LogSaida OUT Logs) IS
  
    CURSOR c_logs IS SELECT Ac.DataIn, Ac.DataOut
                        FROM Acesso Ac WHERE Ac.IdUsuario = v_idusuario
                        ORDER BY Ac.DataIn DESC;  
                        
    TYPE t_logs IS TABLE OF c_logs%ROWTYPE INDEX BY PLS_INTEGER; 
    v_logs t_logs; 
  
    BEGIN
    
      LogEntrada := Logs(); 
      LogSaida := Logs(); 
      
      OPEN c_logs; 
      FETCH c_logs BULK COLLECT INTO v_logs; 
      LogEntrada.EXTEND(v_logs.COUNT); 
      LogSaida.EXTEND(v_logs.COUNT);
      
      FOR i IN 1 .. v_logs.COUNT LOOP
        BEGIN
          LogEntrada(i) := TO_CHAR(v_logs(i).DataIn, 'dd/mm/yyyy hh24:mi:ss'); 
          LogSaida(i) := TO_CHAR(v_logs(i).DataOut, 'dd/mm/yyyy hh24:mi:ss');
        END; 
      END LOOP; 
      
      CLOSE c_logs; 
    
    END getLogs; 

END PackLogin;
