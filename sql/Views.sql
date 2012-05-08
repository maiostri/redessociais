
-- view que recupera as informações das comunidades junto com seus usuários (excluindo os próprios donos)
CREATE OR REPLACE VIEW view_community AS 
  SELECT P.Participante, Com.IdUsuario, Com.Nome, Com.Descricao, Com.NMembros, Com.DataCriacao, Cat.Categoria
    FROM Participa P JOIN Comunidade Com ON (P.IdUsuario = Com.IdUsuario AND P.Comunidade = Com.Nome AND P.Participante <> Com.IdUsuario)
      JOIN Categoria Cat ON (Com.IdUsuario = Cat.IdUsuario AND Com.Nome = Cat.Comunidade)
  WITH READ ONLY CONSTRAINT constraint_read_only;