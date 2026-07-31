
-- Produtos onde DescCategoriaProduto seja 'botas'.
SELECT * FROM produtos 
WHERE DescCategoriaProduto = 'botas';
--IdTransacao, IdCliente, QtdePontos onde QtdePontos seja igual a 0.
SELECT IdTransacao,IdCliente, QtdePontos
FROM transacoes
WHERE qtdePontos = 0;
-- Clientes onde flBlueSky = 1.
SELECT * FROM clientes
WHERE flBlueSky = 1;

--Bloco B
--4. Transações com QtdePontos > 500 E origem 'cursos'.
SELECT * FROM transacoes
WHERE qtdePontos > 500 AND DescSistemaOrigem = 'cursos';
--5. Clientes com flEmail = 1 OU flYouTube = 1.
SELECT * FROM clientes
WHERE flEmail = 1 OR flYouTube = 1;
--6. Transações com QtdePontos entre 50 e 150.
SELECT * FROM transacoes 
WHERE qtdePontos BETWEEN 50 AND 150;
--7. Produtos cujo nome contenha "Prata".
SELECT * FROM produtos
WHERE DescNomeProduto LIKE '%Prata%'
--8. Clientes onde flTwitch = 1 mas flBlueSky = 0.
SELECT * FROM clientes 
WHERE flTwitch = 1 AND flBlueSky = 0;

--Bloco C
--9. Transações ordenadas por QtdePontos do menor pro maior.
SELECT * FROM transacoes
ORDER BY qtdePontos ASC -- eu sei que se deixar sem nada é a mesma coisa de asc nao precisa fala 
--10. Clientes ordenados por qtdePontos DESC, depois por DtCriacao ASC.
SELECT * FROM clientes
ORDER BY qtdePontos DESC, DtCriacao ASC
--11. Produtos ordenados por DescNomeProduto decrescente.
SELECT * FROM produtos 
ORDER BY DescNomeProduto DESC

--Bloco D
--12. As 8 transações com maior QtdePontos.
SELECT * FROM transacoes 
ORDER BY qtdePontos DESC
LIMIT 8;
--13. Os 15 clientes mais recentes.
SELECT * FROM clientes
ORDER BY DtCriacao DESC
LIMIT 15;

--Bloco E
--14. Top 5 clientes com flInstagram = 1, ordenados por qtdePontos DESC.
SELECT * FROM  clientes 
WHERE flInstagram = 0
ORDER BY qtdePontos DESC
LIMIT 5;
-- com flInstagram = 1 Não tem trouxe com 0 pq tem 5 

--15. Os 5 produtos da categoria 'cajado' ordenados por nome.
SELECT * FROM produtos
WHERE DescCategoriaProduto = 'cajado' 
ORDER BY DescNomeProduto
