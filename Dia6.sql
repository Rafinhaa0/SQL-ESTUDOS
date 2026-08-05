--Exercício 038 Nível: Iniciante Cenário
--O gerente de produtos deseja localizar todos os produtos que possuem a palavra
--"Chocolate" no nome.
--ObjetivoListe: ● Nome do produto. ● Preço.
--Retorne apenas produtos com "Chocolate" no nome.
--Dica Utilize uma pesquisa parcial em textos.

SELECT 
    nome_produto,
    preco
FROM produtos 
WHERE nome_produto LIKE '%Chocolate%';

--Exercício 039
-- Nível: Iniciante
--Cenário O setor de estoque quer identificar produtos que possuem grande quantidade armazenada.
-- Objetivo
-- Liste: ● Nome do produto. ● Estoque.
--Retorne produtos com estoque maior ou igual a 300 unidades.
--Dica Utilize operadores de comparação.

SELECT 
    nome_produto,
    estoque
FROM produtos
WHERE estoque >= 300;


--Exercício 040 Nível: Iniciante
-- Cenário A diretoria quer analisar produtos de alto 
-- valor e baixo estoque para avaliar risco de reposição.
--Objetivo Liste:● Nome do produto. ● Preço. ● Estoque.
--Retorne produtos: ● Com preço maior que R$ 500.● Com estoque menor que 50.
--Dica Combine duas condições utilizando operadores lógicos.

SELECT 
    nome_produto,
    preco,
    estoque
FROM produtos
WHERE preco > 500
AND estoque < 50;

--Exercício 041 Nível: Iniciante
-- Cenário O gerente quer identificar clientes que não pertencem aos principais estados de atuação.
-- Objetivo Liste: ● Nome do cliente. ● Estado.
--Retorne clientes que não sejam dos estados:● MG.● SP.● RJ.
--Dica Existe uma forma de negar uma condição.

SELECT 
    nome_cliente,
    estado
FROM clientes
WHERE estado != 'MG' 
AND estado != 'SP'
AND estado != 'RJ';

SELECT 
    nome_cliente,
    estado 
fROM clientes
WHERE estado NOT IN ('MG','SP','RJ');


--Exercício 042 Nível: Iniciante Cenário
-- O setor financeiro deseja consultar vendas realizadas em determinados meses.
--Objetivo Liste: ● ID da venda. ● Data da venda. ● Valor total.
--Retorne vendas realizadas em: ● Janeiro. ● Fevereiro. ● Março de 2025.
--Dica Utilize filtros de datas.

SELECT 
    id_venda,
    data_venda,
    valor_total
FROM vendas 
WHERE data_venda BETWEEN '2025-01-01' AND '2025-03-31';

--Exercício 043 Nível: Iniciante Cenário
--O gerente de estoque deseja localizar produtos que possuem estoque entre 100 e 200 unidades.
--Objetivo Liste: ● Produto.● Estoque.
--Dica Trabalhe com uma faixa de valores

SELECT 
    nome_produto AS Produto,
    estoque
fROM produtos
WHERE estoque BETWEEN 100 AND 200;

--Exercício 044Nível: Iniciante
--Cenário A equipe de marketing quer encontrar clientes cujo nome começa com a letra "A".
--Objetivo Liste: ● Nome do cliente. ● Cidade.
--Dica Pesquisas em textos podem considerar apenas o início da informação

SELECT 
    nome_cliente,
    cidade
FROM clientes
WHERE nome_cliente LIKE 'A%';

--Exercício 045 Nível: Iniciante Cenário
-- O gerente comercial deseja encontrar produtos vendidos por marcas específicas.
-- Objetivo Liste: ● Nome do produto. ● Código da marca.
-- Retorne produtos das marcas:● Coca-Cola.● Samsung.● LG.
--Dica Utilize uma condição para múltiplos valores.

SELECT 
    nome_produto,
    id_marca
FROM produtos
WHERE id_marca IN 
        (       1,
                17,
                18
        );

--Exercício 046 Nível: Iniciante Cenário
--O setor de compras deseja identificar produtos que possuem preço entre R$ 50 e R$ 200.
--Objetivo Liste:   ● Produto.● Preço.
--Dica Use filtro de intervalo.

SELECT 
nome_produto AS Produto,
preco
FROM produtos
WHERE preco BETWEEN 50 AND 200;

--Exercício 047 Nível: Iniciante
-- Cenário A diretoria quer analisar apenas vendas realizadas no ano de 2026.
--Objetivo Liste: ● ID da venda. ● Data.● Valor total.
--Dica Utilize filtro baseado em datas.

SELECT 
    id_venda,
    data_venda,
    valor_total
FROM vendas
WHERE data_venda BETWEEN '2026-01-01' AND '2026-12-31';

--Exercício 048 Nível: Iniciante Cenário
--O gerente de produtos deseja localizar produtos cujo nome possui a palavra "Samsung".
--Objetivo Liste: ● Nome do produto. ● Preço.
--Dica Faça uma busca parcial no nome do produt

SELECT 
    nome_produto,
    preco
FROM produtos
WHERE nome_produto LIKE '%Samsung%';

--Exercício 049 Nível: Iniciante
--Cenário O setor de estoque precisa identificar produtos com quantidade crítica.
--Objetivo Liste: ● Nome do produto. ● Estoque.
--Retorne produtos com estoque menor ou igual a 20.
--Dica Use comparação numérica.

SELECT 
    nome_produto AS Produto,
    estoque 
FROM produtos
WHERE estoque <= 20;

--Exercício 050 Nível: Intermediário
--Cenário O gerente de vendas deseja analisar clientes 
--que realizaram cadastro no segundo semestre de 2025.
--Objetivo Liste: ● Nome do cliente.● Data de cadastro.
--Retorne apenas clientes cadastrados entre julho e dezembro de 2025.
--Dica Datas também podem ser trabalhadas como intervalos.

SELECT 
    nome_cliente,
    data_cadastro
FROM clientes
WHERE data_cadastro BETWEEN '2025-07-01' AND '2025-12-31';

--Exercício 051 Nível: Intermediário Cenário
--O setor comercial quer identificar produtos de categorias específicas para uma campanha.
--ObjetivoListe: ● Nome do produto. ● Preço. ● Estoque.
--Retorne produtos das categorias: ● Eletrônicos. ● Utilidades Domésticas. ● Higiene Pessoal.
--Dica Utilize uma lista de valores para facilitar a consulta.

SELECT 
    nome_produto,
    preco,
    estoque
fROM produtos
WHERE id_categoria IN (9,11,12);
