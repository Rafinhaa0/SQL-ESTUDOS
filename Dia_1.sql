--Exercício 001 Nível: Iniciante

--Cenário
--O gerente da loja deseja conhecer todos os produtos cadastrados no sistema para iniciar
--uma análise do catálogo.
--Objetivo Liste:
--● Nome do produto.
--● Preço.
--● Estoque.
--Dica Comece explorando a tabela que armazena as informações dos produtos.

SELECT
    nome_produto,
    preco,
    estoque
FROM produtos;

--Exercício 002
--Nível: Iniciante
--Cenário
--O setor comercial precisa visualizar uma lista simples com todos os clientes cadastrados
--para uma campanha de relacionamento.
--Objetivo
--Liste:
--● Nome do cliente.
--● Cidade.
--● Estado.
--Dica Utilize apenas as informações necessárias para o relatório.

SELECT
    nome_cliente,
    cidade,
    estado
FROM clientes;

--Exercício 003
--Nível: Iniciante
--Cenário
--O departamento de Recursos Humanos solicitou uma consulta com todos os funcionários
--cadastrados na empresa.
--Objetivo Liste: ● Nome do funcionário. ● Cargo. ● Salário.
--Dica Evite trazer colunas que não foram solicitadas.

SELECT
    nome_funcionario,
    cargo,
    salario
FROM funcionarios;

--Exercício 004Nível: Iniciante Cenário
--O gerente de vendas quer visualizar todas as vendas realizadas pela loja.
--Objetivo Liste: ● Código da venda. ● Data da venda. ● Valor total.
--Dica A tabela de vendas possui todas as informações principais da operação comercial.

SELECT
    id_venda,
    data_venda,
    valor_total
FROM vendas;

--Exercício 005 Nível: Iniciante
--Cenário O setor de estoque precisa consultar rapidamente os produtos disponíveis no sistema.
--Objetivo Liste: ● Nome do produto. ● Quantidade disponível em estoque.
-- Renomeie a coluna de estoque para um nome mais amigável.
--Dica Utilize alias para melhorar a apresentação do relatório

SELECT
    nome_produto AS Produto,
    estoque AS Quantidade
FROM produtos;

--Exercício 006 Nível: Iniciante
-- Cenário O departamento comercial deseja uma listagem dos produtos mostrando seus valores para uma apresentação interna.
--Objetivo Liste: ● Nome do produto. ● Preço.
--Renomeie as colunas para: ● Produto. ● Valor.
--Dica
--Os nomes exibidos no resultado podem ser diferentes dos nomes originais das colunas.

SELECT
    nome_produto AS Produto,
    preco AS Valor
FROM produtos;

--Exercício 007 Nível: Iniciante
-- Cenário
--A diretoria deseja visualizar as informações cadastrais das categorias existentes na loja.
-- Objetivo
--Página 36 Liste: ● Código da categoria. ● Nome da categoria.
--Dica Comece identificando quais informações existem na tabela de categorias

SELECT
    id_categoria AS Codigo,
    nome_categoria AS Nome
FROM categorias;

--Exercício 008
--Nível: Iniciante
--Cenário O setor de compras quer analisar as marcas cadastradas para entender o portfólio atual.
--Objetivo Liste: ● Código da marca. ● Nome da marca.
-- Dica Faça uma consulta simples buscando os dados cadastrados

SELECT 
    id_marca ,
    nome_marca
FROM marcas;

--Exercício 009 Nível: Iniciante
--Cenário O gerente de produtos deseja consultar todos os itens da categoria de bebidas.

--Objetivo
--Liste: Nome do produto. Preço. Estoque.
--Dica Neste momento, apenas visualize os dados disponíveis dos produtos.

SELECT 
    nome_produto,
    preco,
    estoque
FROM produtos;

--Exercício 010
--Nível: Iniciante
--Cenário O setor financeiro quer analisar os valores registrados nas vendas.
--Objetivo Liste: ● Código da venda. ● Valor total.
--Renomeie o valor total para: "Valor da Venda".
-- Dica Utilize alias para deixar o relatório mais profissional.

SELECT 
    id_venda,
    valor_total AS 'Valor da Venda'
FROM vendas;

--Exercício 011 Nível: Iniciante
-- Cenário A equipe de marketing precisa consultar os 
--dados básicos dos clientes para uma análise inicial.
--Objetivo Liste: Nome do cliente. Cidade.
--Renomeie a coluna do nome para: "Cliente".
--Dica Os aliases ajudam bastante na criação de relatórios.

SELECT 
    nome_cliente AS 'Cliente',
    cidade
FROM clientes;

--Exercício 012 Nível: Iniciante
--Cenário O RH deseja criar uma lista com todos os cargos existentes
--entre os funcionários.
--Objetivo Liste: Nome do funcionário. Cargo.
--Dica Neste exercício o objetivo é apenas conhecer os dados existentes.

SELECT 
    nome_funcionario,
    cargo
FROM funcionarios;

--Exercício 013 Nível: Iniciante
--Cenário O gerente de estoque quer visualizar o cadastro completo
--dos produtos para conferência.
--Objetivo Liste:
--Nome do produto.
--Código da categoria.
--Código da marca.
--Preço.
--Estoque.
--Dica Observe quais informações estão disponíveis dentro da tabela produtos.

SELECT 
nome_produto,
id_categoria,
id_marca,
preco,
estoque
FROM produtos;

--Exercício 014 Nível: Iniciante
--Cenário A equipe comercial precisa de uma lista contendo 
--todas as cidades onde existem clientes cadastrados.

--Liste:Nome do cliente.Cidade.Estado.
--Dica Use somente os campos necessários para o relatório.

SELECT 
    nome_cliente,
    cidade,
    estado
FROM clientes;

--Exercício 015 Nível: Iniciante
-- Cenário O gerente deseja analisar os funcionários contratados pela empresa.
-- Objetivo Liste:Nome do funcionário.Data de admissão.
--Renomeie a data para:"Data de Entrada".
--DicA Utilize alias para melhorar a leitura do resultado

SELECT 
    nome_funcionario,
    data_admissao AS 'Data de Entrada'
FROM funcionarios;

--Exercício 016 Nível: Iniciante
--Cenário O setor de vendas deseja visualizar os dados das vendas
-- para uma auditoria interna.
--Objetivo Liste:ID da venda.ID do cliente.ID do funcionário.Valor total.
--Dica Faça uma consulta simples sem aplicar filtros

SELECT 
    id_venda,
    id_cliente,
    id_funcionario,
    valor_total
FROM vendas;

--Exercício 017 Nível: Iniciante
--Cenário
--O gerente de produtos quer visualizar os preços cadastrados no catálogo.
--ObjetivoListe:Nome do produto.Preço.
--Renomeie: Preço → Valor Unitário.
--Dica Os nomes das colunas exibidas podem ser personalizados.

SELECT
    nome_produto,
    preco AS 'Valor Unitário' 
FROM produtos;

--Exercício 018 Nível: Iniciante Cenário
--A equipe de estoque precisa verificar os produtos 
--que possuem controle de quantidade.
--Objetivo Liste:Produto.Estoque Atual.
--Dica Crie um nome de coluna mais amigável usando alias

SELECT 
nome_produto AS 'Produto',
estoque AS 'Estoque Atual'
FROM produtos;

--Exercício 019 Nível: Iniciante Cenário
-- O departamento de compras deseja consultar os dados das marcas parceiras.
--Objetivo Liste: Nome da marca.
--Renomeie para:"Fabricante".
--Dica Um relatório profissional geralmente utiliza nomes mais claros

SELECT 
    nome_marca AS 'Fabricante'
FROM marcas;

--Exercício 020
-- Nível: Iniciante Cenário
--A loja deseja criar uma visão inicial dos clientes cadastrados no ano de 2025.
--ObjetivoListe:Nome do cliente.Data de cadastro.
--Dica Neste exercício o foco é apenas visualizar informações

SELECT 
    nome_cliente,
    data_cadastro 
FROM clientes;

--Exercício 021 Nível: Iniciante Cenário
--O gerente geral solicitou uma lista dos funcionários mostrando informações
--básicas da equipe.
--Objetivo Liste: Nome. Cargo. Salário.
-- Renomeie:
--Salário → Remuneração.
--Dica Use alias para criar nomes mais adequados ao negócio.

SELECT 
    nome_funcionario,
    cargo, 
    salario AS 'Remuneração' 
FROM funcionarios;

--Exercício 022 Nível: Iniciante Cenário
--O setor comercial quer consultar os valores das vendas realizadas no sistema.
--Objetivo
--Liste:Data da venda. Valor total.
--Renomeie: Valor total → Faturamento.
--Dica Pense em como esse resultado seria apresentado para um gestor.

SELECT 
    data_venda, 
    valor_total AS 'Faturamento'  
FROM vendas;

--Exercício 023 Nível: Iniciante Cenário
-- O gerente de produtos deseja visualizar os produtos importados cadastrados.
--Objetivo Liste: Nome do produto. Preço. Estoque.
--Dica Neste momento, apenas conheça a estrutura dos dados.

SELECT 
    nome_produto,
    preco,
    estoque
FROM produtos;

--Exercício 024
--Nível: Iniciante Cenário
--O setor administrativo precisa consultar todas as categorias 
--existentes no sistema.
--Objetivo Liste: Nome da categoria.
--Dica Faça uma consulta simples retornando apenas a informação necessária.

SELECT nome_categoria 
FROM categorias;

--Exercício 025 Nível: Iniciante Cenário
--A diretoria quer uma visão geral do cadastro de produtos antes de 
--iniciar análises maisavançadas.
--Objetivo Liste: Nome do produto.Preço.Estoque.
--Renomeie:Nome do produto → Produto. Estoque → Quantidade Disponível.
--Dica Esse relatório será utilizado como base para análises futuras

SELECT 
    nome_produto AS 'Produto',
    preco, 
    estoque AS 'Quantidade Disponível'
FROM produtos;

--Missão 2 – Encontrando Informações
-- WHERE, LIKE, BETWEEN, IN, AND, OR Exercício 026 Nível: Iniciante Cenário
--O gerente de estoque deseja identificar todos os produtos 
--que possuem pouco estoque para acompanhar possíveis reposições.
--ObjetivoListe:Nome do produto.Estoque.
--Retorne apenas produtos com estoque menor que 50 unidades.
--Dica Utilize uma condição para comparar o valor do estoque.

SELECT 
    nome_produto,
    estoque
fROM produtos
WHERE estoque < 50;

--Exercício 027 Nível: Iniciante Cenário
--O setor comercial quer identificar produtos considerados de alto 
--valor para uma campanha especial.
--Objetivo Liste: Nome do produto. Preço.
--Retorne apenas produtos com preço maior que R$ 100.
--Dica Utilize uma comparação numérica.

SELECT 
    nome_produto,
    preco
fROM produtos
WHERE preco > 100;

--Exercício 028 Nível: Iniciante Cenário
--O gerente deseja encontrar produtos que 
--possuem preço baixo para criar uma promoção.
--Objetivo Liste:Nome do produto.Preço.
--Retorne produtos com preço menor que R$ 5.
--Dica Use filtro com valores numéricos.

SELECT 
    nome_produto,
    preco
FROM produtos
WHERE preco < 5;

--Exercício 029 Nível: Iniciante Cenário
--A equipe de vendas precisa encontrar todos os clientes cadastrados 
--no estado de Minas Gerais.
--Objetivo Liste: Nome do cliente. Cidade.Estado.
--Retorne apenas clientes de MG.
--Dica Filtre utilizando o valor exato do campo estado.

SELECT 
    nome_cliente,
    cidade,
    estado
FROM clientes
WHERE estado = 'MG';

--Exercício 030 Nível: Iniciante
-- O marketing deseja criar uma ação para clientes cadastrados em São Paulo.
--Liste: Nome do cliente. Cidade.
-- Retorne apenas clientes da cidade de São Paulo.
-- Dica Utilize uma condição de igualdade.

SELECT 
    nome_cliente,
    cidade
FROM clientes
WHERE cidade = 'São Paulo';

--Exercício 031 Nível: Iniciante
-- Cenário O gerente financeiro deseja
--analisar vendas de maior valor realizadas pela empresa.
-- Objetivo Liste: ID da venda. Data da venda. Valor total.
--Retorne apenas vendas acima de R$ 1.000.
--Dica Aplique o filtro diretamente no valor da venda.

SELECT 
    id_venda,
    data_venda,
    valor_total
fROM vendas
WHERE valor_total > 1000;

--Exercício 032 Nível: Iniciante
--O setor de estoque quer localizar produtos que estão sem quantidade disponível.
--Objetivo
--Liste: ● Nome do produto.● Estoque.
--Retorne somente produtos com estoque igual a zero.
--Dica Procure pelo valor exato armazenado no estoque.

SELECT 
    nome_produto,
    estoque
FROM produtos
WHERE estoque = 0;

--Exercício 033 Nível: Iniciante
--Cenário
--O gerente de compras quer encontrar produtos de uma faixa específica de preço.
--Objetivo Liste: Nome do produto. Preço.
-- Retorne produtos com preço entre R$ 10 e R$ 20.
--Dica Existe uma forma específica no SQL para trabalhar com intervalos

SELECT 
    nome_produto,
    preco
FROM produtos
WHERE preco BETWEEN 10 AND 20;

--Exercício 034 Nível: Iniciante
--A área comercial deseja encontrar clientes cadastrados
--durante o primeiro trimestre de 2025.
--Liste:Nome do cliente. Data de cadastro.
--Retorne clientes cadastrados entre janeiro e março de 2025.
--Dica Utilize filtro por intervalo de datas

SELECT 
    nome_cliente,
    data_cadastro 
FROM clientes
WHERE data_cadastro BETWEEN '2025-01-01' AND '2025-03-31';

--Exercício 035 Nível: Iniciante Cenário
--O setor de compras precisa localizar produtos pertencentes a algumas categorias
--específicas.
--Liste: Nome do produto. Código da categoria.
--Retorne produtos das categorias: Bebidas. Alimentos. Carnes.
--Dica Quando existem vários valores possíveis, 
--existe uma forma mais organizada de escrever a
--condição

SELECT 
    nome_produto AS 'Produto',
    id_categoria AS 'Código da categoria'
FROM produtos
WHERE id_categoria IN 
(   1,
    2,
    3
);

--Exercício 036 Nível: Iniciante Cenário
--O gerente comercial deseja localizar funcionários 
--que possuem cargos de liderança.
--Objetivo Liste: Nome do funcionário. Cargo.
-- Retorne funcionários com os cargos: Gerente Geral.Gerente Loja.Gerente Comercial.
-- Dica Utilize filtro para buscar diferentes possibilidades.

SELECT 
    nome_funcionario,
    cargo 
FROM funcionarios
WHERE cargo IN 
(
    'Gerente Geral',
    'Gerente Loja',
    'Gerente Comercial'
);

--Exercício 037 Nível: Iniciante Cenário
-- O marketing quer encontrar produtos relacionados à marca Coca-Cola.
-- Liste: Nome do produto. Marca.
--Retorne produtos cujo nome contenha "Coca".
--Dica Para procurar partes de um texto, utilize busca por padrão

















