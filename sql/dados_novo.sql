--Tabela Usuario
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto) 
          values (SeqIdUsuario.nextVal, 'Wen', 'Li', to_date('08/06/1990', 'dd/mm/yyyy'), 'F', 'Beijing', 'China', 'Iowa City', 'Estados Unidos', default);
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto) 
          values (SeqIdUsuario.nextVal, 'Kostas', 'Eftaxias', to_date('15/11/1989', 'dd/mm/yyyy'), 'M', 'Grecia', 'Atenas', 'Sao Paulo', 'Brasil', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'David', 'Jarzebowski', to_date('05/01/1991', 'dd/mm/yyyy'), 'M', 'Bristol', 'Inglaterra', 'Oxford', 'Inglaterra', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Andres', 'Coca', to_date('25/10/1985', 'dd/mm/yyyy'), 'M', 'Cali', 'Colombia', 'La Paz', 'Bolivia', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Prasenjit', 'Saha', to_date('07/10/1985', 'dd/mm/yyyy'), 'M', 'Tunis', 'Tunisia', 'Paris', 'France', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Patricia', 'Saba', to_date('26/10/1987', 'dd/mm/yyyy'), 'F', 'Ramsgate', 'Inglaterra', 'Tunis', 'Tunisia', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Simone', 'Verde', to_date('05/10/1992', 'dd/mm/yyyy'), 'F', 'Nice', 'Franca', 'Mexico DF', 'Mexico', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Aj', 'Felicani', to_date('04/05/1991', 'dd/mm/yyyy'), 'M', 'Caracas', 'Venezuela', 'Lima', 'Peru', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Barbara', 'Campos', to_date('01/02/1993', 'dd/mm/yyyy'), 'F', 'Santiado de Chile', 'Chile', 'Mar del Plata', 'Argentina', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Matias', 'Nassif', to_date('10/03/1987', 'dd/mm/yyyy'), 'M', 'Montevideo', 'Uruguay', 'Rio de Janeiro', 'Brasil', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Antonietta', 'Dinatale', to_date('14/02/1991', 'dd/mm/yyyy'), 'F', 'Roma', 'Italia', 'Lisboa', 'Portugal', default); 
insert into Usuario (IdUsuario, Nome, Sobrenome, DataNasc, Sexo, CidadeOrigem, PaisOrigem, CidadeAtual, PaisAtual, Foto)  
          values (SeqIdUsuario.nextVal, 'Camila', 'Howell', to_date('21/12/1985', 'dd/mm/yyyy'), 'F', 'Pretona', 'Africa do Sul', 'Lousiana', 'Estados Unidos', default); 

--Tabela Telefone
insert into Telefone (Telefone, IdUsuario) values ('476896453', 1);
insert into Telefone (Telefone, IdUsuario) values ('216465487', 2);
insert into Telefone (Telefone, IdUsuario) values ('256485251', 3);
insert into Telefone (Telefone, IdUsuario) values ('234584752', 4);
insert into Telefone (Telefone, IdUsuario) values ('104477811', 5);
insert into Telefone (Telefone, IdUsuario) values ('789643114', 6);
insert into Telefone (Telefone, IdUsuario) values ('214545622', 7);
insert into Telefone (Telefone, IdUsuario) values ('165421441', 8);
insert into Telefone (Telefone, IdUsuario) values ('894121242', 9);
insert into Telefone (Telefone, IdUsuario) values ('251054101', 10);
insert into Telefone (Telefone, IdUsuario) values ('878121004', 11);
insert into Telefone (Telefone, IdUsuario) values ('326854100', 12);

--Tabela Email
insert into Email (Email, IdUsuario) values ('wnlius@usa.net', 1);
insert into Email (Email, IdUsuario) values ('kostasrr@greecos.net', 2);
insert into Email (Email, IdUsuario) values ('djarzebowski@msc.uk', 3);
insert into Email (Email, IdUsuario) values ('andrescb@gmail.com', 4);
insert into Email (Email, IdUsuario) values ('saha1254@tunnet.tu', 5);
insert into Email (Email, IdUsuario) values ('pattysaba@googlemail.uk', 6);
insert into Email (Email, IdUsuario) values ('simverde92@hotmail.com', 7);
insert into Email (Email, IdUsuario) values ('felicanija@caracas.net', 8);
insert into Email (Email, IdUsuario) values ('campos.barb@gmail.com', 9);
insert into Email (Email, IdUsuario) values ('nassifmatias23@mixmail.com', 10);
insert into Email (Email, IdUsuario) values ('dinataleaaa@gmail.com', 11);
insert into Email (Email, IdUsuario) values ('caclaudiah@hotmail.com', 12);

--Tabela Amizade
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hi what s up?!', 1, 2, to_date('14/01/2009 11:01', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Fine!', 2, 1, to_date('14/01/2009 11:01', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hello', 1, 3, to_date('15/01/2009 13:20', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hi!!!', 3, 1, to_date('15/01/2009 13:20', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Fine doc!', 1, 5, to_date('14/01/2009 20:21', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Fine...!', 5, 1, to_date('14/01/2009 20:21', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Easy?!', 1, 7,to_date('14/01/2009 20:23', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Yeap!!!', 7, 1, to_date('14/01/2009 20:23', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'I like u!', 1, 9, to_date('14/01/2009 20:24', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'shhh', 9, 1, to_date('14/01/2009 20:24', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'I like u!', 1, 12, to_date('14/01/2009 20:30', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'shhh', 12, 1, to_date('14/01/2009 20:30', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Do u remember me?!', 2, 4, to_date('14/01/2009 11:05', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'I dooooo!', 4, 2, to_date('14/01/2009 11:05', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hi?!', 2, 6, to_date('14/01/2009 11:10', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hiii!', 6, 2, to_date('14/01/2009 11:10', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Come n... accept me?!', 2, 8, to_date('14/01/2009 11:20', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Done', 8, 2, to_date('14/01/2009 11:20', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'I found u', 2, 10, to_date('14/01/2009 11:25', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'great!', 10, 2, to_date('14/01/2009 11:25', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Everything fine!', 2, 12, to_date('14/01/2009 11:27', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'yes!', 12, 2, to_date('14/01/2009 11:27', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Say yes!', 3, 5, to_date('15/01/2009 13:22', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'YEEAP!', 5, 3, to_date('15/01/2009 13:22', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Nice pics!!!', 3, 7, to_date('15/01/2009 13:25', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Thk u!', 7, 3, to_date('15/01/2009 13:25', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Awesome pics!!!', 3, 9, to_date('15/01/2009 13:28', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'hehehe I love them!', 9, 3, to_date('15/01/2009 13:28', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hello there!!!', 3, 11, to_date('15/01/2009 13:30', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hi, how r u!?', 11, 3, to_date('15/01/2009 13:30', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'I also have an account', 4, 6, to_date('18/01/2009 19:25', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Isnt great?!', 6, 4, to_date('18/01/2009 19:25', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'I like ur pics', 4, 8, to_date('16/01/2009 15:15', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'thanks!', 8, 4, to_date('16/01/2009 15:15', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hi, how r u', 4, 10, to_date('16/01/2009 15:19', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'fine doc, and u?', 10, 4, to_date('16/01/2009 15:19', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'Hi my friend!', 4, 12, to_date('16/01/2009 15:23', 'dd/mm/yyyy HH24:MI'));
insert into Amizade (IdAmizade, Mensagem, Remetente, Destinatario, Data) 
             values (SeqIdAmizade.nextVal, 'hello, fine?', 12, 4, to_date('16/01/2009 15:23', 'dd/mm/yyyy HH24:MI'));

--Tabela Grupo       
insert into Grupo (IdUsuario, Nome, NMembros) values (1, 'Faculty', 2);
insert into Grupo (IdUsuario, Nome, NMembros) values (1, 'MyFriends', 2);
insert into Grupo (IdUsuario, Nome, NMembros) values (1, 'Love', 2);
insert into Grupo (IdUsuario, Nome, NMembros) values (2, 'Faculty', 3);
insert into Grupo (IdUsuario, Nome, NMembros) values (2, 'Friends', 3);
insert into Grupo (IdUsuario, Nome, NMembros) values (3, 'MyFriends', 3);
insert into Grupo (IdUsuario, Nome, NMembros) values (3, 'BFF', 2);
insert into Grupo (IdUsuario, Nome, NMembros) values (4, 'Home', 2);        
insert into Grupo (IdUsuario, Nome, NMembros) values (4, 'School', 3);             
insert into Grupo (IdUsuario, Nome, NMembros) values (5, 'Friends', 2);             
insert into Grupo (IdUsuario, Nome, NMembros) values (6, 'Friends', 2);             
insert into Grupo (IdUsuario, Nome, NMembros) values (7, 'Friends', 2);             
insert into Grupo (IdUsuario, Nome, NMembros) values (8, 'Friends', 2);             
insert into Grupo (IdUsuario, Nome, NMembros) values (9, 'Friends', 2);             
insert into Grupo (IdUsuario, Nome, NMembros) values (10, 'Friends', 2);             
insert into Grupo (IdUsuario, Nome, NMembros) values (11, 'Friends', 1);             
insert into Grupo (IdUsuario, Nome, NMembros) values (12, 'Friends', 2);             
insert into Grupo (IdUsuario, Nome, NMembros) values (12, 'Love', 1);  

insert into Compoe (IdUsuario, Grupo, IdAmizade) values (1, 'Faculty', 1);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (1, 'Faculty', 3); 
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (1, 'MyFriends', 5);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (1, 'MyFriends', 7);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (1, 'Love', 9);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (1, 'Love', 11);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (2, 'Faculty', 2); 
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (2, 'Faculty', 13); 
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (2, 'Faculty', 15);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (2, 'Friends', 17);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (2, 'Friends', 19);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (2, 'Friends', 21);       
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (3, 'MyFriends', 4);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (3, 'MyFriends', 23);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (3, 'MyFriends', 25);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (3, 'BFF', 27);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (3, 'BFF', 29);
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (4, 'Home', 14);        
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (4, 'Home', 31);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (4, 'School', 33);    
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (4, 'School', 35);    
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (4, 'School', 37);                 
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (5, 'Friends', 6);   
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (5, 'Friends', 24);                
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (6, 'Friends', 16);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (6, 'Friends', 32);                          
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (7, 'Friends', 8); 
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (7, 'Friends', 26);              
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (8, 'Friends', 18);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (8, 'Friends', 34);                          
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (9, 'Friends', 10);         
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (9, 'Friends', 28);                       
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (10, 'Friends', 20);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (10, 'Friends', 36);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (11, 'Friends', 30);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (12, 'Friends', 22);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (12, 'Friends', 38);             
insert into Compoe (IdUsuario, Grupo, IdAmizade) values (12, 'Love', 12); 

--Tabela Conta
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (1, '/002-Liwen', 'LiWen', 'keyboard2010', to_date('01/01/2009 13:00', 'dd/mm/yyyy HH24:MI'));
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (2, '/003-KostasWQ', 'KostasWQ', 'ABCDE1234', to_date('02/01/2009 14:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (3, '/004-DavidJdwki', 'DavidJdwki', '147852', to_date('03/01/2009 15:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (4, '/005-CocaAndres', 'CocaAndres', 'iphone32gb', to_date('04/01/2009 16:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (5, '/006-Saha123', 'Saha123', '?s8914as', to_date('05/01/2009 17:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (6, '/007-PattsS', 'PattsS', '6874641qw', to_date('06/01/2009 18:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (7, '/008-GreenS', 'GreenS', 'AbaB123', to_date('07/01/2009 19:00', 'dd/mm/yyyy HH24:MI'));                          
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (8, '/009-AjAjAj', 'AjAjAj', 'qwerty', to_date('08/02/2009 20:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (9, '/010-CamposBAB', 'CamposBAB', 'somuch<3', to_date('09/01/2009 21:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (10, '/011-Matiiiias', 'Matiiiias', 'INOUT123', to_date('10/01/2009 22:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (11, '/012-AntoDin', 'AntoDin', 'itsnotyours', to_date('11/01/2009 23:00', 'dd/mm/yyyy HH24:MI'));             
insert into Conta (IdUsuario, URL, Nick, Senha, DataCriacao) 
             values (12, '/013-Cahowell', 'Cahowell', 'llewohac', to_date('12/01/2009 23:30', 'dd/mm/yyyy HH24:MI')); 

--Tabela Acesso
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (1, to_date('01/01/2009 13:00', 'dd/mm/yyyy HH24:MI'), to_date('01/01/2009 15:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (1, to_date('13/01/2009 18:20', 'dd/mm/yyyy HH24:MI'), to_date('13/01/2009 20:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (1, to_date('14/01/2009 20:20', 'dd/mm/yyyy HH24:MI'), to_date('14/01/2009 22:20', 'dd/mm/yyyy HH24:MI'));  
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (2, to_date('02/01/2009 14:00', 'dd/mm/yyyy HH24:MI'), to_date('02/01/2009 16:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (2, to_date('14/01/2009 11:10', 'dd/mm/yyyy HH24:MI'), to_date('14/01/2009 12:16', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (3, to_date('03/01/2009 15:00', 'dd/mm/yyyy HH24:MI'), to_date('03/01/2009 19:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (3, to_date('15/01/2009 13:13', 'dd/mm/yyyy HH24:MI'), to_date('15/01/2009 14:16', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (4, to_date('04/01/2009 16:00', 'dd/mm/yyyy HH24:MI'), to_date('04/01/2009 21:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (4, to_date('16/01/2009 15:10', 'dd/mm/yyyy HH24:MI'), to_date('16/01/2009 16:16', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (5, to_date('05/01/2009 17:00', 'dd/mm/yyyy HH24:MI'), to_date('05/01/2009 17:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (5, to_date('17/01/2009 17:39', 'dd/mm/yyyy HH24:MI'), to_date('17/01/2009 18:16', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (6, to_date('06/01/2009 18:00', 'dd/mm/yyyy HH24:MI'), to_date('06/01/2009 19:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (6, to_date('18/01/2009 19:23', 'dd/mm/yyyy HH24:MI'), to_date('18/01/2009 20:47', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (7, to_date('07/01/2009 19:00', 'dd/mm/yyyy HH24:MI'), to_date('07/01/2009 21:01', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (7, to_date('19/01/2009 21:19', 'dd/mm/yyyy HH24:MI'), to_date('19/01/2009 22:18', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (8, to_date('08/01/2009 20:00', 'dd/mm/yyyy HH24:MI'), to_date('08/01/2009 23:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (8, to_date('19/01/2009 23:12', 'dd/mm/yyyy HH24:MI'), to_date('19/01/2009 23:58', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (9, to_date('09/01/2009 21:00', 'dd/mm/yyyy HH24:MI'), to_date('09/01/2009 23:54', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (9, to_date('18/01/2009 21:32', 'dd/mm/yyyy HH24:MI'), to_date('18/01/2009 22:16', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (10, to_date('10/01/2009 22:00', 'dd/mm/yyyy HH24:MI'), to_date('10/01/2009 23:20', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (10, to_date('17/01/2009 19:10', 'dd/mm/yyyy HH24:MI'), to_date('17/01/2009 22:08', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (11, to_date('11/01/2009 23:00', 'dd/mm/yyyy HH24:MI'), to_date('11/01/2009 23:36', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (11, to_date('16/01/2009 23:31', 'dd/mm/yyyy HH24:MI'), to_date('16/01/2009 23:50', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (12, to_date('12/01/2009 23:30', 'dd/mm/yyyy HH24:MI'), to_date('12/01/2009 23:47', 'dd/mm/yyyy HH24:MI'));    
insert into Acesso (IdUsuario, DataIn, DataOut) 
             values (12, to_date('15/01/2009 10:10', 'dd/mm/yyyy HH24:MI'), to_date('15/01/2009 15:23', 'dd/mm/yyyy HH24:MI'));


--Tabela Comunidade
insert into Comunidade (IdUsuario, Nome, Descricao, NMembros, DataCriacao) 
                values (1, 'Lost Community', 'For everybody who likes Lost', 2, to_date('13/01/2009 18:40', 'dd/mm/yyyy HH24:MI'));
insert into Comunidade (IdUsuario, Nome, Descricao, NMembros, DataCriacao) 
                values (1, 'Surfing', 'The best surfing community!', 3, to_date('13/01/2009 18:50', 'dd/mm/yyyy HH24:MI'));
insert into Comunidade (IdUsuario, Nome, Descricao, NMembros, DataCriacao) 
                values (2, 'Lord of the Rings', 'This no need any description', 2, to_date('14/01/2009 11:20', 'dd/mm/yyyy HH24:MI'));
insert into Comunidade (IdUsuario, Nome, Descricao, NMembros, DataCriacao) 
                values (3, 'Help Cancer Patients', 'A community to help cancer patients!', 3, to_date('15/01/2009 13:15', 'dd/mm/yyyy HH24:MI'));

--Tabela Participa
insert into Participa (Participante, IdUsuario, Comunidade) values (1, 1, 'Lost Community');
insert into Participa (Participante, IdUsuario, Comunidade) values (12, 1, 'Lost Community');
insert into Participa (Participante, IdUsuario, Comunidade) values (1, 1, 'Surfing');
insert into Participa (Participante, IdUsuario, Comunidade) values (4, 1, 'Surfing');
insert into Participa (Participante, IdUsuario, Comunidade) values (9, 1, 'Surfing');
insert into Participa (Participante, IdUsuario, Comunidade) values (2, 2, 'Lord of the Rings');
insert into Participa (Participante, IdUsuario, Comunidade) values (6, 2, 'Lord of the Rings');
insert into Participa (Participante, IdUsuario, Comunidade) values (3, 3, 'Help Cancer Patients');
insert into Participa (Participante, IdUsuario, Comunidade) values (4, 3, 'Help Cancer Patients');
insert into Participa (Participante, IdUsuario, Comunidade) values (5, 3, 'Help Cancer Patients');

--Tabela Categoria             
insert into Categoria (Categoria, IdUsuario, Comunidade) values ('Series', 1, 'Lost Community');
insert into Categoria (Categoria, IdUsuario, Comunidade) values ('Entertainment', 1, 'Lost Community');
insert into Categoria (Categoria, IdUsuario, Comunidade) values ('Sport', 1, 'Surfing');
insert into Categoria (Categoria, IdUsuario, Comunidade) values ('Entertainment', 1, 'Surfing');
insert into Categoria (Categoria, IdUsuario, Comunidade) values ('Entertainment', 2, 'Lord of the Rings');
insert into Categoria (Categoria, IdUsuario, Comunidade) values ('Movies', 2, 'Lord of the Rings');
insert into Categoria (Categoria, IdUsuario, Comunidade) values ('Support', 3, 'Help Cancer Patients');

--Tabela Objeto
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'F', to_date('14/01/2009 20:21', 'dd/mm/yyyy HH24:MI'), null, null, 1 );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'F', to_date('14/01/2009 20:23', 'dd/mm/yyyy HH24:MI'), null, null, 1 );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'A', to_date('14/01/2009 20:20', 'dd/mm/yyyy HH24:MI'), null, null, 1 );                
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'F', to_date('14/01/2009 11:15', 'dd/mm/yyyy HH24:MI'), null, null, 2 );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'A', to_date('14/01/2009 11:12', 'dd/mm/yyyy HH24:MI'), null, null, 2 );                
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'F', to_date('15/01/2009 13:50', 'dd/mm/yyyy HH24:MI'), null, null, 3 );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'A', to_date('15/01/2009 13:13', 'dd/mm/yyyy HH24:MI'), null, null, 3 );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'F', to_date('13/01/2009 18:30', 'dd/mm/yyyy HH24:MI'), 'Surfing', 1, null );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'A', to_date('13/01/2009 18:25', 'dd/mm/yyyy HH24:MI'), 'Surfing', 1, null );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'P', to_date('13/01/2009 18:40', 'dd/mm/yyyy HH24:MI'), 'Surfing', 1, null );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'P', to_date('02/01/2009 14:10', 'dd/mm/yyyy HH24:MI'), null, null, 2 );
insert into Objeto (IdObjeto, Tipo, DataCriacao, Comunidade, DonoComunidade, IdUsuario) 
                values (SeqIdObjeto.nextVal, 'P', to_date('02/01/2009 14:15', 'dd/mm/yyyy HH24:MI'), null, null, 2 );

--Tabela Interage
insert into Interage (IdUsuario, Grupo, IdObjeto, Permissao) values (1, 'Faculty', 3, 'V');
insert into Interage (IdUsuario, Grupo, IdObjeto, Permissao) values (1, 'MyFriends', 3, 'C');
insert into Interage (IdUsuario, Grupo, IdObjeto, Permissao) values (1, 'Love', 3, 'C');
insert into Interage (IdUsuario, Grupo, IdObjeto, Permissao) values (2, 'Faculty', 5, 'C');
insert into Interage (IdUsuario, Grupo, IdObjeto, Permissao) values (2, 'Friends', 5, 'V');
insert into Interage (IdUsuario, Grupo, IdObjeto, Permissao) values (3, 'MyFriends', 7, 'C');
insert into Interage (IdUsuario, Grupo, IdObjeto, Permissao) values (3, 'BFF', 7, 'V');

--Tabela Album
insert into Album(IdObjeto, Nome, LocalAlbum, NFotos) values(3, 'Friends', 'My house', 2);
insert into Album(IdObjeto, Nome, LocalAlbum, NFotos) values(5, 'Some pics', 'Rio', 1);
insert into Album(IdObjeto, Nome, LocalAlbum, NFotos) values(7, 'Holydays', 'Ibiza', 1);
insert into Album(IdObjeto, Nome, LocalAlbum, NFotos) values(9, 'I live here', 'NY', 1);

--Tabela Foto
insert into Foto(IdObjeto, Descricao, Arquivo, Imagem, Album) values (1, 'My best friends', '20001.png', default, 3);
insert into Foto(IdObjeto, Descricao, Arquivo, Imagem, Album) values (2, 'I like this!', '20002.png', default, 3);
insert into Foto(IdObjeto, Descricao, Arquivo, Imagem, Album) values (4, ' ', '30001.png', default, 5);
insert into Foto(IdObjeto, Descricao, Arquivo, Imagem, Album) values (6, ' ', '40001.png', EMPTY_BLOB(), 7);
insert into Foto(IdObjeto, Descricao, Arquivo, Imagem, Album) values (8, ' ', '20003.png', EMPTY_BLOB(), 9);
            
--Tabela Post
insert into Post(IdObjeto, LinkPost, Conteudo) values (10,' ', 'I like this picture');
insert into Post(IdObjeto, LinkPost, Conteudo) values (11,' ', 'Here everybody there!');
insert into Post(IdObjeto, LinkPost, Conteudo) values (12,' ', 'This is really funny!');

--Tabela Comentario
insert into Comentario(Remetente, Post, IdObjeto) values (2, 11, 1);
insert into Comentario(Remetente, Post, IdObjeto) values (1, 10, 12);






