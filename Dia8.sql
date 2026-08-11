--🟢 PARTE 1 — DISTINCT
--1. Sistemas de origem

--Liste todos os sistemas de origem diferentes existentes
--na tabela transacoes.

--Exiba apenas:DescSistemaOrigem

SELECT 
DISTINCT DescSistemaOrigem 
FROM transacoes;

--2. Categorias de produtos
--Liste todas as categorias diferentes existentes na tabela produtos.

SELECT 
DISTINCT DescCategoriaProduto 
FROM produtos;

--3. Quantidades de produtos
-- Liste todas as quantidades diferentes de produtos registradas
-- em transacao_produto.
-- Ordene da menor para a maior.


SELECT DISTINCT QtdeProduto
FROM transacao_produto
ORDER BY QtdeProduto DESC;

--4. Pontuações registradas

--Liste todas as quantidades de pontos diferentes existentes
--na tabela transacoes.
--Ordene da maior para a menor.

SELECT DISTINCT QtdePontos fROM transacoes
ORDER BY QtdePontos DESC;

--🔵 PARTE 2 — SUM
--5. Total de pontos
--Calcule a soma de todos os pontos registrados na tabela transacoes.

SELECT 
	SUM(QtdePontos) AS Total
fROM transacoes;

--6. Total de pontos dos clientes
--Calcule a soma de qtdePontos da tabela clientes.

SELECT SUM(QtdePontos)
fROM clientes;

--7. Total de produtos vendidos
--Calcule a soma de QtdeProduto na tabela transacao_produto.

SELECT 
SUM(QtdeProduto)
FROM transacao_produto;

--8. Total filtrado 🔥
--Calcule a soma de QtdePontos das transações que:
--possuem entre 10 e 100 pontos
--foram originadas por twitch ou youtube.
--Aqui já misture: SUM + WHERE + BETWEEN + IN

SELECT 
	SUM(QtdePontos) AS TotalDePontos
fROM transacoes
where QtdePontos BETWEEN 10 AND 100
AND DescSistemaOrigem IN ('twitch','youtube');

--🟣 PARTE 3 — AVG
--9. Média de pontos
--Calcule a média de QtdePontos das transações.

SELECT 
	AVG(QtdePontos) AS MEDIA_PONTOS
FROM transacoes;

--10. Média de pontos dos clientes
--Calcule a média de qtdePontos dos clientes.

SELECT AVG(qtdePontos) FROM clientes;

--11. Média filtrada

--Calcule a média de pontos das transações originadas por:twitch youtube

SELECT 
	AVG(QtdePontos) 
FROM transacoes
WHERE DescSistemaOrigem IN ('twitch','youtube');

--12. Média de clientes específicos

--Calcule a média de pontos dos clientes que: possuem e-mail
-- e possuem mais de 500 pontos.
-- Aqui você precisa combinar: AVG + WHERE + AND

SELECT 
	AVG(qtdePontos) 
FROM clientes
WHERE qtdePontos > 500
AND flEmail = 1

--🟠 PARTE 4 — MIN / MAX
--13. Menor pontuação
--Encontre a menor quantidade de pontos registrada em transacoes.

SELECT MIN(QtdePontos)
FROM transacoes;

--14. Maior pontuação
--Encontre a maior quantidade de pontos registrada em transacoes.
SELECT MAX(QtdePontos)
FROM transacoes;

--15. Menor e maior pontuação
--Em uma única consulta, mostre:menor pontuação - maior pontuação

SELECT 
MAX(QtdePontos) AS Maior,
MIN(QtdePontos) AS Menor
fROM transacoes;

--16. Maior pontuação do Twitch 🔥

-- Encontre a maior quantidade de pontos registrada em uma transação
-- originada pelo twitch.

SELECT 
	MAX(QtdePontos)
FROM transacoes
WHERE DescSistemaOrigem IN ('twitch');

--17. Menor pontuação em determinado intervalo
-- Encontre a menor quantidade de pontos das transações 
-- que possuem entre 10 e 100 pontos.

SELECT 
  MIN(QtdePontos)
FROM transacoes
WHERE QtdePontos BETWEEN 10 AND 100;

--🔥 PARTE 5 — COMBINAÇÃO
--Agora começa a parte importante.
--18. Total de pontos relevantes
--Calcule o total de pontos das transações que:
--possuem entre 10 e 100 pontos são do twitch ou youtube

SELECT 
COUNT(QtdePontos) 
FROM transacoes
WHERE QtdePontos BETWEEN 10 AND 100
AND DescSistemaOrigem IN ('twitch','youtube');

--19. Média de clientes prioritários
--Calcule a média de pontos dos clientes que:
--possuem mais de 1.000 pontos possuem e-mail ou Instagram.

SELECT 
AVG(qtdePontos)
FROM clientes
WHERE qtdePontos > 1000
AND (flInstagram = 1 
OR flEmail = 1);

--20. Maior transação recente
--Encontre a maior quantidade de pontos em uma transação criada a partir de 2025.

SELECT 
MAX(QtdePontos)
fROM transacoes 
WHERE DtCriacao >= '2025-01-01';

--21. Menor transação de determinados sistemas

--Encontre a menor quantidade de pontos entre as transações cujo sistema
--de origem seja:twitch youtube cursos

SELECT MIN(QtdePontos) 
FROM transacoes
WHERE DescSistemaOrigem IN ('twitch','youtube','cursos');

--🧠 PARTE 6 — REVISÃO DOS FILTROS
--22. Top 10 clientes
--Mostre os 10 clientes com maior pontuação que:
--possuem e-mail possuem pelo menos 500 pontos.
--Use: TOP + WHERE + AND + ORDER BY
SELECT 
	TOP 10 * 
fROM clientes
WHERE qtdePontos >= 500
AND flEmail = 1
ORDER BY qtdePontos DESC;

--23. Produtos específicos Mostre os produtos:

--da categoria espada ou armadura cujo nome contenha "A"

-- Ordene alfabeticamente.

SELECT * FROM produtos
WHERE DescCategoriaProduto IN ('espada','armadura')
AND DescNomeProduto LIKE '%A%'
ORDER BY DescNomeProduto ASC;

--24. Transações investigadas
--Mostre as 20 maiores transações que:
--possuem entre 20 e 200 pontos são provenientes de twitch ou youtube

SELECT 
TOP 20 * 
fROM transacoes 
WHERE QtdePontos BETWEEN 20 AND 200
AND DescSistemaOrigem IN ('twitch','youtube')
order by QtdePontos desc;

--25. Clientes recentes

--Mostre os 15 clientes com maior pontuação que:

--foram criados a partir de 2025 possuem e-mail ou Instagram
--possuem entre 500 e 5.000 pontos.

SELECT TOP 15 * FROM clientes
WHERE DtCriacao >= '2025-01-01' 
AND (flInstagram = 1 OR flEmail = 1)
AND qtdePontos BETWEEN 500 AND 5000
ORDER BY qtdePontos DESC;

--💀 DESAFIOS FINAIS
--26. Investigação de pontuação

--O suporte quer descobrir:

--Qual é a maior, menor e média quantidade de pontos das transações
--originadas por Twitch?

SELECT 
MAX(QtdePontos) AS MAIOR,
MIN(QtdePontos) AS MENOR,
AVG(QtdePontos) AS MEDIA
FROM transacoes
WHERE DescSistemaOrigem = 'twitch';

--27. Investigação de produtos

--O suporte quer analisar os produtos cuja categoria seja: espada armadura
--e cujo nome contenha "A".

--Calcule:
--Qual é a maior quantidade de produto (QtdeProduto) registrada para esses produtos?

--⚠️ Você vai precisar pensar em como relacionar o filtro da tabela produtos 
--com os dados de transacao_produto.

SELECT * fROM produtos
WHERE DescCategoriaProduto IN ('espada','armadura')
AND DescNomeProduto LIKE '%A%';

SELECT max(QtdeProduto) FROM transacao_produto
WHERE IdProduto = '5'

-- nao da pra fazer sem join e group by 






