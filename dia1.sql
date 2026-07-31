--Bloco A — SELECT e WHERE básico Liste todas as colunas de produtos onde DescCategoriaProduto seja uma categoria específica.
SELECT *
FROM produtos
WHERE DescCategoriaProduto = 'espada';
--Liste IdTransacao, IdCliente e QtdePontos de transacoes onde QtdePontos seja maior que 100.
SELECT IdTransacao,
    idCliente,
    qtdePontos
FROM transacoes
WHERE qtdePontos > 100;
--Liste os clientes (clientes) onde flEmail seja igual a 1 (ou o valor que representar "tem e-mail" nessa tabela — confere o schema).
SELECT *
FROM clientes
WHERE flEmail = 1;
--4. Transações onde QtdePontos > 50 E DescSistemaOrigem seja uma origem específica.
SELECT *
FROM transacoes
WHERE qtdePontos > 50
    AND DescSistemaOrigem = 'cursos';
--5. Transações onde DescSistemaOrigem seja uma origem OU outra (tenta primeiro com OR, depois reescreve com IN).
SELECT * FROM transacoes
WHERE DescSistemaOrigem = 'facebook' OR DescSistemaOrigem = 'cursos';

SELECT * FROM transacoes
WHERE DescSistemaOrigem IN ('Kick', 'Facebook', 'twitch');
--6. Transações com QtdePontos entre 100 e 500 (BETWEEN).
SELECT * FROM transacoes 
WHERE QtdePontos BETWEEN 100 AND 500;

--7. Produtos cujo nome (DescNomeProduto) contenha um pedaço de texto específico (LIKE '%termo%').
SELECT * FROM produtos
WHERE DescNomeProduto LIKE '%esp%';


--8. Clientes onde flInstagram = 1 mas flTwitch = 0 (combinando AND com negação). 

SELECT * FROM clientes 
WHERE flInstagram = 1 AND flTwitch = 0;








