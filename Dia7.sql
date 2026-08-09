--🔵 BLOCO 1 — SELECT + WHERE
--1. Clientes com pontuação específica

--Liste todos os clientes que possuem mais de 1.000 pontos.

--Exiba:idCliente qtdePontos

SELECT 
	idCliente,
	qtdePontos
FROM clientes
WHERE qtdePontos > 1000;


--2. Clientes recentes

--Liste os clientes criados a partir de 01/01/2025.

--Exiba:idCliente DtCriacao qtdePontos

SELECT 
	idCliente,
	DtCriacao, 
	qtdePontos
FROM clientes
WHERE DtCriacao > '2025-01-01 00:00:00.0000000';

--3. Transações de Twitch
--Liste todas as transações cujo sistema de origem seja twitch.
--Exiba: IdTransacao IdCliente QtdePontos DescSistemaOrigem

SELECT 
IdTransacao,
IdCliente, 
QtdePontos,
DescSistemaOrigem
FROM transacoes 
WHERE DescSistemaOrigem = 'twitch';

--4. Produtos da categoria espada
--Liste todos os produtos cuja categoria seja espada.
--Exiba:IdProduto DescNomeProduto DescCategoriaProduto

SELECT 
IdProduto,
DescNomeProduto,
DescCategoriaProduto
FROM produtos
WHERE DescCategoriaProduto = 'espada';

--🟢 BLOCO 2 — AND
--5. Clientes com duas condições
--Encontre clientes que:possuem mais de 500 pontos
--e possuem e-mail cadastrado (flEmail = 1)

SELECT * FROM clientes
WHERE qtdePontos > 500
AND flEmail = 1;

--6. Clientes de uma determinada faixa
--Encontre clientes que:possuem pelo menos 100 pontos e foram criados em 2025
-- NAO ESPECIFOU SE FOI SÓ EM 2025 ENTAO COLOQUEI MAIOR 

SELECT * FROM clientes
WHERE qtdePontos >= 100 
AND DtCriacao >= '2025-01-01 00:00:00.0000000';

--7. Transações específicas
--Liste transações que:
--possuem mais de 10 pontos
--e foram originadas pelo twitch.

SELECT * FROM transacoes 
WHERE QtdePontos > 10
AND DescSistemaOrigem = 'twitch';

--8. Produtos específicos
--Liste produtos que:
--pertencem à categoria armadura
--e possuem no nome a palavra relacionada a "Couro".
--Aqui você já vai precisar combinar AND com LIKE.

SELECT * FROM produtos
WHERE DescCategoriaProduto = 'armadura'
AND DescNomeProduto LIKE '%Couro%';

--🟡 BLOCO 3 — OR
--9. Clientes de redes específicas
--Liste clientes que possuem:
--Twitch ou YouTube ativo.

SELECT * FROM clientes
WHERE flYouTube = 1 
OR flTwitch = 1;

--10. Clientes com canais
--Encontre clientes que possuem Instagram ou BlueSky ativo.

SELECT * fROM clientes
WHERE flInstagram = 1
OR flBlueSky = 1;

--11. Transações de diferentes sistemas
--Liste transações cujo sistema de origem seja:
--twitch ou outro sistema que você encontrar nos dados.

SELECT * FROM transacoes 
WHERE DescSistemaOrigem = 'twitch' 
OR DescSistemaOrigem = 'cursos';

--12. Produtos de categorias diferentes

--Liste produtos que pertencem à categoria:

--espada ou armadura.

SELECT * FROM produtos
WHERE DescCategoriaProduto = 'espada'
OR DescCategoriaProduto = 'armadura';

--🟠 BLOCO 4 — BETWEEN
--13. Pontuação intermediária
--Liste clientes que possuem entre 100 e 1.000 pontos.
--Exiba:idCliente,qtdePontos

SELECT * FROM clientes
WHERE qtdePontos BETWEEN 100 AND 1000;

--14. Clientes criados em determinado período
--Liste clientes criados entre: 01/01/2025 e 31/12/2025
--Exiba:idCliente, DtCriacao ,qtdePontos

SELECT
	idCliente,
	DtCriacao,
	qtdePontos
FROM clientes
WHERE DtCriacao BETWEEN '2025-01-01 00:00:00.0000000' AND '2025-12-31 00:00:00.0000000';


--15. Transações por quantidade de pontos
--Liste transações que possuem entre 5 e 20 pontos.
--Ordene da maior para a menor quantidade de pontos.

SELECT * FROM transacoes
WHERE QtdePontos BETWEEN 5 AND 20
ORDER BY QtdePontos ASC;

--16. Produtos por preço

--Na tabela transacao_produto, 
--encontre registros cujo vlProduto esteja entre 10 e 100.

--Exiba:IdProduto QtdeProduto vlProduto

SELECT 
	IdProduto, 
	QtdeProduto,
	vlProduto
fROM transacao_produto
WHERE vlProduto BETWEEN 10 AND 100;

--🔴 BLOCO 5 — IN
--17. Categorias específicas

--Liste produtos que pertencem às categorias: espada,armadura,escudo

SELECT * FROM produtos
WHERE DescCategoriaProduto IN ('espada','armadura','escudo');

--18. Sistemas de origem

--Liste transações cujo sistema de origem esteja entre:

--twitch youtube instagram

SELECT * FROM transacoes 
WHERE DescSistemaOrigem IN ('twitch','youtube','instagram');

--19. Pontuações específicas

--Liste clientes que possuem exatamente uma destas quantidades de pontos:

--10, 50, 100, 500, 1000

SELECT * FROM clientes
WHERE qtdePontos IN (10, 50, 100, 500, 1000);

--20. Quantidades de produto

--Na tabela transacao_produto, encontre registros onde QtdeProduto seja:

--1 2 5 10

SELECT * FROM transacao_produto
WHERE QtdeProduto  IN (1, 2, 5, 10);

--🟣 BLOCO 6 — LIKE
--21. Produtos com "Espada"

--Liste produtos cujo nome contenha: Espada

SELECT * FROM produtos
WHERE DescNomeProduto LIKE '%Espada%';

--22. Produtos começando com determinada palavra

--Liste produtos cujo nome comece com: Armadura

SELECT * FROM produtos
WHERE DescNomeProduto LIKE 'Armadura%';

--23. Produtos terminando com determinada palavra

--Liste produtos cujo nome termine com: Longa
SELECT * FROM produtos
WHERE DescNomeProduto LIKE '%Longa';

--24. Descrição contendo "aço"

--Procure produtos cuja descrição contenha a palavra: aço
SELECT * FROM produtos
WHERE DescDescricaoProduto LIKE '%aço%';

--25. Categoria parcialmente conhecida

--Liste produtos cuja categoria contenha a sequência: arm
SELECT * FROM produtos
WHERE DescDescricaoProduto LIKE '%arm%';

--🔥 BLOCO 7 — COMBINAÇÃO DE FILTROS


--26. Cliente prioritário

--Encontre clientes que: possuem mais de 1.000 pontos possuem e-mail
--foram criados em 2025 ou depois

SELECT * FROM clientes	
WHERE flEmail = 1 
AND DtCriacao >= '2025-01-01 00:00:00.0000000';

--27. Cliente de múltiplas plataformas

--Encontre clientes que possuem:

--Twitch ou YouTube e possuem mais de 500 pontos.

SELECT * 
FROM clientes
WHERE (flYouTube = 1 OR flTwitch = 1)
AND qtdePontos > 500;

--28. Transações suspeitas
--Encontre transações que: possuem entre 10 e 100 pontos 
--e vieram de twitch ou youtube.

SELECT * FROM transacoes 
WHERE (QtdePontos BETWEEN 10 AND 100)
AND DescSistemaOrigem IN ('twitch','youtube');

--29. Produtos de interesse Encontre produtos que:
--sejam da categoria espada ou armadura
--e tenham "Aço" ou "Couro" na descrição.

--Aqui você precisa pensar bastante na combinação:

SELECT * FROM produtos
WHERE DescCategoriaProduto IN ('espada','armadura')
AND (DescDescricaoProduto LIKE '%Aço%' OR DescDescricaoProduto LIKE '%Couro%');

--🏆 BLOCO 8 — ORDER BY + TOP
--31. Top 10 clientes
--Mostre os 10 clientes com maior quantidade de pontos.

SELECT TOP 10 * fROM clientes
ORDER BY qtdePontos DESC;

--32. Top 20 transações

--Mostre as 20 transações com maior quantidade de pontos.
SELECT TOP 20 * FROM transacoes 
ORDER BY QtdePontos DESC;

---33. Menores pontuações
--Mostre os 15 clientes com menor quantidade de pontos.
SELECT * fROM clientes
ORDER BY qtdePontos ASC;


-- CONTANDO COM O -0 

SELECT * FROM clientes
WHERE qtdePontos < -0 
ORDER BY qtdePontos ASC;

--34. Clientes recentes com maior pontuação

--Mostre os 20 clientes criados em 2025 ou depois que possuem mais pontos.
--Você vai precisar combinar: TOP + WHERE + ORDER BY

SELECT TOP 20 * FROM clientes
WHERE DtCriacao >= '2025-01-01 00:00:00.0000000'
ORDER BY qtdePontos DESC;

--35. Transações Twitch

--Mostre as 15 maiores transações do Twitch, considerando QtdePontos.

SELECT TOP 15 * FROM transacoes 
WHERE DescSistemaOrigem = 'Twitch'
ORDER BY QtdePontos DESC;

--36. Investigação de cliente
--Um analista quer encontrar clientes que:
--tenham entre 500 e 5.000 pontos, tenham e-mail ou Instagram ativo
--e tenham sido cadastrados a partir de 2025.
--Mostre somente os 20 primeiros, do maior para o menor em pontos.

SELECT TOP 20 * FROM clientes
WHERE qtdePontos BETWEEN 500 AND 5000
AND (flEmail = 1 OR flInstagram = 1)
AND DtCriacao >= '2025-01-01 00:00:00.0000000'
ORDER BY qtdePontos DESC;

--37. Investigação de produto

--O suporte recebeu uma reclamação relacionada a produtos de espada ou armadura,
--cujo nome contenha "A".

--Liste esses produtos em ordem alfabética.

SELECT * FROM produtos
WHERE DescNomeProduto LIKE '%A%'
ORDER BY DescNomeProduto ASC;

--38. Investigação de transações

--O suporte quer investigar transações:

--entre 5 e 50 pontos;
--provenientes de Twitch ou YouTube;
--ordenadas da maior para a menor pontuação.
--Mostre somente as 30 primeiras.

SELECT TOP 30 *
FROM transacoes 
WHERE QtdePontos BETWEEN 5 AND 50
AND DescSistemaOrigem IN ('Twitch','YouTube')
ORDER BY QtdePontos DESC;

--39. Clientes potencialmente importantes
--Encontre os 25 clientes com maior pontuação que:
--possuem e-mail ou Instagram;
--possuem pelo menos 1.000 pontos.

SELECT TOP 25 *
fROM clientes 
WHERE qtdePontos >= 1000
AND (flInstagram = 1 OR flEmail = 1)
ORDER BY qtdePontos DESC;

--40. 🔥 DESAFIO FINAL

--O time de suporte quer encontrar clientes recentes e relevantes.
--Considere relevantes os clientes que:
--possuem entre 1.000 e 10.000 pontos
--foram criados em 2025 ou 2026
--possuem e-mail, Twitch ou Instagram
--devem aparecer do maior para o menor número de pontos
--mostre somente os 30 primeiros

SELECT TOP 30 *
FROM clientes 
WHERE qtdePontos BETWEEN 1000 AND 10000
AND DtCriacao 
BETWEEN '2025-01-01 00:00:00.0000000' AND '2026-12-31 00:00:00.0000000'
AND flEmail = 1 
OR (flTwitch = 1 OR flInstagram = 1)
ORDER BY qtdePontos DESC;




