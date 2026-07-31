--Dia 3 - 30 exercícios
--Bloco A — SELECT + WHERE

--1.Liste todos os produtos da categoria espada.
SELECT * FROM produtos
WHERE DescCategoriaProduto = 'espada';

--2.Liste todos os clientes que possuem flEmail = 1.
SELECT * FROM clientes
WHERE flEmail = 1;

--3.Liste apenas IdTransacao, IdCliente e QtdePontos das transações com menos de 100 pontos.
SELECT IdTransacao, idCliente, qtdePontos
FROM transacoes
WHERE qtdePontos < 100;

--Bloco B — AND / OR / NOT

--4.Liste os clientes que possuem Twitch e YouTube.
SELECT * FROM clientes
WHERE flTwitch = 1 AND flYouTube = 1;

--5.Liste os clientes que possuem Instagram ou BlueSky.
SELECT * FROM clientes
WHERE flInstagram = 1 OR flBlueSky = 1;

--6.Liste os clientes que não possuem e-mail (flEmail = 0).
SELECT * FROM clientes
WHERE flEmail = 0;

--Bloco C — BETWEEN

--7.Liste as transações cuja QtdePontos esteja entre 100 e 500.
SELECT * FROM transacoes 
WHERE qtdePontos BETWEEN 100 AND 500;

--8.Liste os clientes cuja qtdePontos esteja entre 500 e 2000.
SELECT * FROM clientes
WHERE qtdePontos BETWEEN 500 AND 2000;

--Bloco D — IN

--9.Liste os produtos das categorias: espada armadura botas
SELECT * FROM produtos
WHERE DescCategoriaProduto IN ('espada','armadura','botas');



--10.Liste as transações cuja origem (DescSistemaOrigem) seja:twitch,cursos

SELECT * FROM transacoes
WHERE DescSistemaOrigem IN('twitch','cursos');

--Bloco E — LIKE

--11.Liste os produtos cujo nome contenha a palavra Espada.
SELECT * FROM produtos
WHERE DescNomeProduto LIKE '%Espada%';

--12.Liste os produtos cujo nome comece com Cajado.
SELECT * FROM produtos
WHERE DescNomeProduto LIKE 'Cajado%';

--13.Liste os produtos cujo nome termine com Gelo.
SELECT * FROM produtos
WHERE DescNomeProduto LIKE '%Gelo';

--Bloco F — ORDER BY + LIMIT

--14.Mostre os 10 clientes com maior quantidade de pontos.
SELECT * FROM clientes
ORDER BY qtdePontos DESC
LIMIT 10;

--Desafio

--15.Mostre os 5 produtos da categoria chapeu cujo nome contenha a palavra "do", ordenados alfabeticamente.
SELECT * FROM produtos
WHERE DescCategoriaProduto = 'chapeu' AND 
DescNomeProduto LIKE '%do%' 
ORDER BY DescCategoriaProduto DESC
LIMIT 5;

-- Dia 3 — 16-30 exercícios
-- Bloco A — SELECT + WHERE

-- 16.Liste o identificador, nome e categoria de todos os produtos cuja categoria seja "armadura" e que possuam a palavra "ferro" no nome.
SELECT * FROM produtos
WHERE DescCategoriaProduto = 'armadura' 
AND DescNomeProduto LIKE '%ferro%';

-- 17.Liste todos os clientes que possuem e-mail (flEmail = 1) e Twitch (flTwitch = 1), mas que não possuem Instagram (flInstagram = 0). Mostre apenas as colunas idCliente, qtdePontos e DtCriacao.
SELECT idCliente,qtdePontos,DtCriacao
FROM clientes
    WHERE flEmail = 1 
    AND flTwitch = 1 
    AND flInstagram = 0;


-- 18.Liste o identificador da transação, o identificador do cliente e a quantidade de pontos das transações que possuam exatamente 0 pontos e que tenham sido criadas a partir do dia 01/01/2026.

SELECT IdTransacao, idCliente, qtdePontos
 FROM transacoes
 WHERE qtdePontos = 0 
 AND DtCriacao >= '01-01-2026';

-- Bloco B — AND / OR / NOT

-- 19.Liste os clientes que possuem Twitch e BlueSky, mas não possuem YouTube. Exiba todas as colunas da tabela de clientes.
SELECT * FROM clientes 
WHERE flTwitch = 1 
AND flBlueSky = 1
AND flYouTube = 0;


-- 20.Liste os clientes que possuem Instagram ou YouTube, e que ao mesmo tempo possuam mais de 1000 pontos. Mostre idCliente, flInstagram, flYouTube e qtdePontos.

SELECT idCliente, flInstagram, flYouTube, qtdePontos 
FROM clientes
WHERE flInstagram = 1 
OR flYouTube = 1
AND qtdePontos > 100;

-- 21.Liste os clientes que não possuem nenhuma rede social. Considere que "não possuir rede social" significa que todas as colunas de flags (flEmail, flTwitch, flYouTube, flBlueSky, flInstagram) são iguais a 0.
SELECT * FROM clientes 
WHERE flEmail = 0
AND flTwitch = 0
AND flYouTube = 0
AND flBlueSky = 0
AND flInstagram= 0;

-- Bloco C — BETWEEN

-- 22.Liste as transações cuja quantidade de pontos esteja entre 50 e 300, mas apenas aquelas cuja origem seja 'twitch'. Mostre IdTransacao, IdCliente, QtdePontos e DtCriacao.
SELECT IdTransacao, IdCliente, QtdePontos, DtCriacao 
FROM transacoes
WHERE qtdePontos BETWEEN 50 AND 300
AND DescSistemaOrigem = 'twitch';


-- 23.Liste os clientes cuja pontuação total (qtdePontos) esteja entre 2000 e 5000 e que tenham sido criados entre 01/06/2025 e 31/12/2025. Exiba idCliente, qtdePontos e DtCriacao.
SELECT idCliente, qtdePontos,DtCriacao 
FROM clientes
WHERE qtdePontos BETWEEN 2000 AND 5000
AND DtCriacao BETWEEN '01-06-2025' AND '32-12-2025';

-- Bloco D — IN

-- 24.Liste os produtos das categorias 'poção', 'cajado' e 'livro' que possuam a palavra "mágico" em qualquer parte do nome ou da descrição. Utilize IN.
SELECT * FROM produtos
WHERE DescCategoriaProduto IN ('poção', 'cajado', 'livro')
AND DescNomeProduto IN ('mágico')
AND DescDescricaoProduto IN ('mágico');

-- 25.Liste as transações cuja origem (DescSistemaOrigem) seja 'twitch', 'cursos' ou 'eventos' e que possuam quantidade de pontos maior que 50. Mostre IdTransacao, IdCliente, DescSistemaOrigem e QtdePontos. Utilize IN.
SELECT IdTransacao, IdCliente, DescSistemaOrigem, QtdePontos
FROM transacoes
WHERE DescSistemaOrigem IN ('twitch', 'cursos', 'eventos')
AND qtdePontos > 50;


-- Bloco E — LIKE

-- 26.Liste os produtos cujo nome contenha a palavra "Dragão", mas que não contenham a palavra "Escama". Mostre o identificador, nome e categoria do produto.
SELECT IdProduto,DescNomeProduto,DescCategoriaProduto
FROM produtos 
WHERE DescNomeProduto LIKE '%Dragão%'
AND DescNomeProduto NOT LIKE '%Escama%';

-- 27.Liste os produtos cujo nome comece com "Poção" e que contenham exatamente a palavra "Cura" em qualquer posição após o início do nome. Mostre todas as colunas.
SELECT * FROM produtos
WHERE DescNomeProduto LIKE 'Poção%'
AND DescNomeProduto LIKE '%Cura%';

-- 28.Liste os produtos cujo nome termine com "Fogo" ou cuja descrição contenha a palavra "lendário". Mostre o nome, a descrição e a categoria do produto.
SELECT DescNomeProduto, DescNomeProduto, DescCategoriaProduto
FROM produtos
WHERE DescNomeProduto LIKE '%fogo'
AND DescDescricaoProduto LIKE '%lendário%';



-- Bloco F — ORDER BY + LIMIT

-- 29.Mostre os 15 clientes que possuem a maior quantidade de pontos, mas apenas aqueles que foram criados no ano de 2026. Ordene do maior para o menor e exiba idCliente, qtdePontos e DtCriacao.

SELECT idCliente, qtdePontos, DtCriacao
FROM clientes
WHERE DtCriacao >= '2026-01-01 00:00:00'
ORDER BY qtdePontos DESC
LIMIT 15;

-- Desafio

-- 30.Liste os 5 produtos da categoria 'armadura' cujo nome contenha a palavra "Ferro" e que não contenham a palavra "Pesada". Ordene pelo nome do produto em ordem alfabética decrescente (Z a A) e mostre apenas as colunas DescNomeProduto e DescCategoriaProduto.

SELECT DescNomeProduto,DescCategoriaProduto
FROM produtos
WHERE DescCategoriaProduto = 'armadura'
AND DescNomeProduto LIKE '%Ferro%'
AND DescNomeProduto NOT LIKE '%Pesada%'
ORDER BY DescNomeProduto DESC;

📊 Resumo
Exercício	Situação
1, 2, 3, 4, 6, 7, 10, 11, 12, 14, 15	✅ Perfeitos
5	⚠️ Parênteses + valor errado (100 em vez de 1000)
8	⚠️ Data inválida (32/12)
9	⚠️ IN não funciona com LIKE
13	⚠️ AND no lugar de OR + coluna repetida no SELECT