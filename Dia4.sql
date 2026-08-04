-- ## Dia 4  — 30 exercícios
-- ### Bloco A — WHERE composto
-- 1. Transações com `QtdePontos > 500` E origem `'twitch'`.
SELECT *
FROM transacoes
WHERE qtdePontos > 500
    AND DescSistemaOrigem = 'twitch';
-- 2. Clientes com `flEmail = 1` E `flTwitch = 1` E `flYouTube = 0`.
SELECT *
FROM clientes
WHERE flEmail = 1
    AND flTwitch = 1
    AND flYouTube = 0;
-- 3. Produtos com categoria `'espada'` OU `'adaga'`, mas nome NÃO contendo `'Curta'`.
SELECT *
FROM produtos
WHERE DescCategoriaProduto = 'espada'
    OR DescCategoriaProduto = 'adaga'
    AND DescNomeProduto NOT LIKE 'Curta';
-- 4. Transações com `QtdePontos` **negativo** (menor que 0).
SELECT *
FROM transacoes
WHERE qtdePontos < 0;
-- 5. Clientes com `flInstagram = 0` E `flBlueSky = 0` E `flYouTube = 0` E `flTwitch = 0`.
SELECT *
FROM clientes
WHERE flInstagram = 0
    AND flBlueSky = 0
    AND flYouTube = 0
    AND flTwitch = 0;
-- ### Bloco B — IN, BETWEEN e negação
-- 6. Produtos com categoria `IN ('espada','adaga','cajado','rpg')` e nome não contendo `'Longa'`.
SELECT *
FROM produtos
WHERE DescCategoriaProduto IN ('espada', 'adaga', 'cajado', 'rpg')
    AND DescNomeProduto NOT LIKE 'Longa';
-- 7. Transações com origem `NOT IN ('cursos')`.
SELECT *
FROM transacoes
WHERE DescSistemaOrigem NOT IN ('cursos');
-- 8. Clientes com `qtdePontos` entre 1000 e 5000.
SELECT *
FROM clientes
WHERE qtdePontos BETWEEN 1000 AND 5000;
-- 9. Transações com `QtdePontos BETWEEN -5000 AND -1000` (só as bem negativas).
SELECT *
FROM transacoes
WHERE qtdePontos BETWEEN -5000 AND -1000;
-- 10. Produtos com categoria diferente de `'espada'` E diferente de `'adaga'`.
SELECT *
FROM produtos
WHERE DescCategoriaProduto != 'espada'
    AND DescCategoriaProduto != 'adaga';
-- ### Bloco C — LIKE
-- 11. Produtos cujo nome contenha `'de '` (padrão "X de Y").
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%de %';
-- 12. Produtos cujo nome contenha `'do '` (padrão "X do Y").
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%do %';
-- 13. Produtos cujo nome comece com `'Chapéu'`.
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE 'Chapéu%';
-- 14. Produtos cujo nome NÃO contenha nem `'a'` nem `'e'`.
SELECT *
FROM produtos
WHERE DescNomeProduto NOT LIKE '%a%'
    OR DescNomeProduto NOT LIKE '%e%';
-- 15. Produtos com categoria `'chat'` OU `'churn_model'` (categorias que parecem ser de sistema, não de jogo).
SELECT *
FROM produtos
WHERE DescCategoriaProduto = 'chat'
    OR DescCategoriaProduto = 'churn_model';
-- ### Bloco D — ORDER BY em múltiplos níveis
-- 16. Transações ordenadas por origem ASC, depois por pontos DESC.
SELECT *
FROM transacoes
ORDER BY DescSistemaOrigem ASC,
    qtdePontos DESC;
-- 17. Clientes com `flEmail = 1`, ordenados por `qtdePontos DESC`, depois `DtCriacao ASC`.
SELECT *
FROM clientes
WHERE flEmail = 1
ORDER BY qtdePontos DESC,
    DtCriacao ASC;
-- 18. Produtos com categoria `IN ('espada','adaga')`, ordenados por categoria ASC e nome DESC.
SELECT *
FROM produtos
WHERE DescCategoriaProduto IN ('espada', 'adaga')
ORDER BY DescCategoriaProduto ASC,
    DescNomeProduto DESC;
-- 19. Transações com pontos negativos, ordenadas da mais negativa pra menos negativa.
SELECT *
FROM transacoes
WHERE qtdePontos < 0
ORDER BY qtdePontos ASC;
-- 20. Clientes ordenados por `qtdePontos ASC` (do menor/mais negativo pro maior).
SELECT *
FROM clientes
ORDER BY qtdePontos ASC;
-- ### Bloco E — LIMIT aplicado a filtros compostos
-- 21. Top 10 transações com pontos acima de 500, origem `'twitch'`, ordenadas do maior pro menor.
SELECT *
FROM transacoes
WHERE QtdePontos > 500
    AND DescSistemaOrigem = 'twitch'
ORDER BY qtdePontos DESC
LIMIT 10;
-- 22. Os 5 clientes mais antigos entre os que têm `flTwitch = 1`.
SELECT *
FROM clientes
WHERE flTwitch = 1
ORDER BY DtCriacao ASC
LIMIT 5;
-- 23. Os 8 produtos de categoria `IN ('espada','adaga','cajado')` com nome contendo `'a'`, em ordem alfabética.
SELECT *
FROM produtos
WHERE DescCategoriaProduto IN ('espada', 'adaga', 'cajado')
    AND DescNomeProduto LIKE '%a%'
ORDER BY DescNomeProduto ASC
LIMIT 8;
-- 24. As 15 transações com pontuação mais negativa (menor valor).
SELECT *
FROM transacoes
WHERE qtdePontos < 0
ORDER BY qtdePontos ASC
LIMIT 15;
-- 25. Os 5 clientes com maior `qtdePontos` entre os que têm `flEmail = 0`.
SELECT *
FROM clientes
WHERE flEmail = 0
ORDER BY qtdePontos DESC
LIMIT 5;
-- ### Bloco F — Cenário de investigação
-- 26. "Transações estranhas": as 20 com `QtdePontos` mais negativo, mostrando cliente, origem e data — candidatas a chamado de "pontos sumiram".
SELECT idCliente,
    DescSistemaOrigem,
    DtCriacao,
    qtdePontos AS pontos_sumiram
FROM transacoes
WHERE qtdePontos < 0
ORDER BY qtdePontos ASC
LIMIT 20;
-- 27. "Clientes digitalmente inativos e antigos": todas as 5 flags = 0, ordenados pelos mais antigos, LIMIT 25.
SELECT *
FROM clientes
WHERE flBlueSky = 0
    AND flEmail = 0
    AND flInstagram = 0
    AND flTwitch = 0
    AND flYouTube = 0
ORDER BY DtCriacao ASC
LIMIT 25;
-- 28. "Top 10 por pontos, só de quem usa Twitch": `flTwitch = 1`, ordenado por `qtdePontos DESC`, LIMIT 10.
SELECT *
FROM clientes
WHERE flTwitch = 1
ORDER BY qtdePontos DESC
LIMIT 10;
-- 29. "Transações fora da curva": origem `'twitch'` E (`QtdePontos < -10000` OU `QtdePontos > 5000`).
SELECT *,
    qtdePontos AS foraDaCurva
FROM transacoes
WHERE DescSistemaOrigem = 'twitch'
    AND qtdePontos < -10000
    OR qtdePontos > 5000;
-- 30. "Auditoria de categoria de sistema": produtos com categoria `IN ('chat','churn_model','streamelements')`, ordenados por nome.
SELECT *
FROM produtos
WHERE DescCategoriaProduto IN ('chat', 'churn_model', 'streamelements')
ORDER BY DescNomeProduto ASC;
--Bloco 1 — Chamados de "pontos sumiram / errados"
--#1001 — Cliente 7107771a-0558-4aaa-a66e-570205a7f367 reclama que seus pontos ficaram negativos do nada. Encontre todas as transações desse cliente com pontos negativos.
SELECT *
FROM transacoes
WHERE idCliente = '7107771a-0558-4aaa-a66e-570205a7f367'
    AND qtdePontos < 0;
--#1002 — Time financeiro pede: "quero ver as 25 transações com maior perda de pontos (mais negativas) de toda a base, pra auditar hoje".
SELECT *
FROM transacoes
WHERE qtdePontos < 0
ORDER BY qtdePontos ASC
LIMIT 25;
--#1003 — Um cliente do Twitch diz que recebeu pontos demais numa live, mais de 5000 de uma vez. Confirme se isso realmente aconteceu, filtrando origem 'twitch' com pontos acima de 5000.
SELECT *
FROM transacoes
WHERE DescSistemaOrigem = 'twitch'
    AND qtdePontos > 5000;
--#1004 — Suporte N2 pede pra isolar transações "suspeitas": pontos menores que -10000 OU maiores que 8000, em toda a base.
SELECT *
FROM transacoes
WHERE qtdePontos -10000
    AND qtdePontos > 8000;
--#1005 — Gestor quer saber se algum cliente de origem 'cursos' teve pontuação zerada ou negativa.
SELECT *
FROM transacoes
WHERE DescSistemaOrigem = 'cursos'
    AND QtdePontos <= 0;
--Bloco 2 — Chamados de catálogo/produto
--#1006 — Loja quer remover da vitrine tudo que for categoria de sistema: 'chat', 'churn_model' e 'streamelements'.
SELECT *
FROM produtos
WHERE DescCategoriaProduto IN ('chat', 'churn_model', 'streamelements');
--#1007 — Time de conteúdo quer revisar itens de "Espada" ou "Adaga" com nome sugerindo raridade — busque por 'Flamejante' ou 'Sombria' no nome.
SELECT *
FROM produtos
WHERE DescCategoriaProduto IN ('espada', 'adaga')
    AND DescNomeProduto LIKE '%Sombria%'
    OR DescNomeProduto LIKE '%Flamejante%';
--#1008 — Reclamação: "o item de categoria 'cajado' que eu queria comprar sumiu do catálogo". Confirme quantos e quais produtos de categoria 'cajado' ainda existem.
SELECT DescNomeProduto,
    DescCategoriaProduto,
    DescDescricaoProduto
FROM produtos
WHERE DescCategoriaProduto = 'cajado';
--#1009 — Auditoria pede: listar todos os produtos cuja categoria não seja 'espada', 'adaga' nem 'cajado'.
SELECT *
FROM produtos
WHERE DescCategoriaProduto NOT IN ('espada', 'adaga', 'cajado');
--#1010 — Cliente pergunta se existe algum item com "Prata" no nome disponível.
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%prata%';
--Bloco 3 — Chamados de conta/perfil de cliente
--#1011 — Cliente 000dc0f6-e4f2-4a42-b8cd-b586ed1c709a diz "conectei todas as minhas redes sociais e não recebi o bônus". Confirme se esse cliente realmente tem as 5 flags (flEmail, flTwitch, flYouTube, flBlueSky, flInstagram) todas iguais a 1.
SELECT *
FROM clientes
WHERE IdCliente = '000dc0f6-e4f2-4a42-b8cd-b586ed1c709a'
    AND flEmail = 1
    AND flTwitch = 1
    AND flYouTube = 1
    AND flBlueSky = 1
    AND flInstagram = 1;
--pra confirma que ele nao tem 
SELECT *
FROM clientes
WHERE IdCliente = '000dc0f6-e4f2-4a42-b8cd-b586ed1c709a' --#1012 — Compliance pede lista de clientes sem nenhuma rede social conectada (todas as 5 flags = 0), mas com qtdePontos acima de 10000 — perfil suspeito.
SELECT *
FROM clientes
WHERE flEmail = 0
    AND flTwitch = 0
    AND flYouTube = 0
    AND flBlueSky = 0
    AND flInstagram = 0
    AND qtdePontos >= 10000;
--#1013 — Suporte recebe reclamação de cliente antigo dizendo que a conta "sumiu do sistema". Liste os 10 clientes mais antigos cadastrados.
SELECT *
FROM clientes
ORDER BY DtCriacao ASC
LIMIT 10 --#1014 — Time de CRM quer contatar só clientes engajados: com flEmail = 1 E flTwitch = 1.
SELECT *
FROM clientes
WHERE flEmail = 1
    AND flTwitch = 1
    AND flYouTube = 0
    AND flBlueSky = 0
    AND flInstagram = 0;
-- se a pergunta e somente os dois 1 e o resto 0 então ta ai, Voce nao especificou se é clientes Somente com essas redes sociais e as outras nao 
--#1015 — Auditoria de segurança: existe algum cliente com qtdePontos negativo na tabela clientes? Liste esses casos, se existirem.
SELECT *
FROM clientes
WHERE qtdePontos < 0;
--#1016 — Cliente 163022e8-12b8-486f-8604-57d8fa0ed7e1 liga reclamando do saldo de pontos e pede pra você mostrar o histórico completo dele, do maior valor pro menor, pra ele conferir.
SELECT *
FROM transacoes
WHERE idCliente = '163022e8-12b8-486f-8604-57d8fa0ed7e1'
ORDER BY qtdePontos DESC;
--#1017 — Financeiro pede uma lista de tudo que veio de curso online com valor fora do padrão normal, da situação mais extrema pra menos extrema.
SELECT *
FROM transacoes
WHERE DescSistemaOrigem = 'cursos'
    AND qtdePontos > 5000
    OR qtdePontos <= -7000;
--#1018 — Um cliente diz que o nome do item de espada que ele resgatou veio estranho. Pede pra você mostrar todos os itens dessa linha, em ordem alfabética, pra ele comparar.
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%espada%'
ORDER BY DescNomeProduto ASC;
--#1019 — Chamado urgente: o time quer ver, agora, os casos mais recentes de perda de pontos vindos da live da Twitch — só os 5 últimos.
SELECT *
FROM transacoes
WHERE DescSistemaOrigem = 'twitch'
    AND qtdePontos < -0
ORDER BY DtCriacao DESC
LIMIT 5 --#1020 — Marketing quer uma lista de clientes que estão "quase lá" perto de um certo patamar de pontos, pra uma campanha — perto de mil pontos, pra mais ou pra menos.
SELECT idCliente,
    qtdePontos
FROM clientes
WHERE qtdePontos BETWEEN 850 AND 999;
--#1021 — Alguém no time avisou que pode ter sumido item de chapéu do catálogo. Confirma se ainda tem, e quantos.
SELECT *
FROM produtos
WHERE DescCategoriaProduto = 'chapeu';
--#1022 — Cliente reclama que os pontos do curso que ele fez não apareceram na conta dele. Antes de escalar, você quer descartar a possibilidade de terem entrado zerados.
-- como nao informou o cliente vou pegar um aleatorio 
SELECT idCliente,
    qtdePontos
FROM transacoes
WHERE idCliente = '000dc0f6-e4f2-4a42-b8cd-b586ed1c709a';
--#1023 — Auditoria pede uma lista de clientes cuja pontuação bateu certinho em algum valor redondo específico (mil ou cinco mil), pra investigar se não é coincidência.
SELECT *
FROM transacoes
WHERE qtdePontos = 1000 --#1024 — Cliente pergunta se ainda existe algum item relacionado a "vento" disponível pra resgate.
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%vento%';
--#1025 — Time de fraude pede uma lista, para investigação, de clientes sem nenhuma presença digital conectada na conta, ordenados pelos que têm mais pontos primeiro.
SELECT *
FROM clientes
WHERE flBlueSky = 0
    AND flEmail = 0
    AND flInstagram = 0
    AND flTwitch = 0
    AND flYouTube = 0
ORDER BY qtdePontos DESC;
--#1026 — Produto quer saber quantos itens do catálogo têm nome no estilo "de alguém" ou "de algo" (tipo posse), pra um relatório de nomenclatura.
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%alguem%';
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%de algo%';
--puxei de alguém, alguem, de algo. algo e nao encontrei ninguem
--#1027 — Terceira reclamação da semana sobre pontos sumindo. Você decide montar a query final de triagem: os piores casos de perda de pontos, do mais grave pro menos grave, só os 10 primeiros.
SELECT *
FROM transacoes
WHERE qtdePontos <= -10000
ORDER BY qtdePontos DESC
LIMIT 10;
--#1028 — Compliance pergunta se existe algum item duplicado ou ambíguo no catálogo com nome sugerindo "antigo" — pede pra confirmar se existe ou não.
SELECT *
FROM produtos
WHERE DescNomeProduto LIKE '%antigo%';
--#1029 — Alguém quer saber quantos clientes vindos da Twitch têm bastante pontos acumulados (bem acima da média), do maior pro menor.
SELECT *
FROM transacoes
WHERE DescSistemaOrigem = 'twitch'
    AND qtdePontos >= 1900
ORDER BY qtdePontos DESC;
--#1030 — Cliente 14d5f91d-a339-4ed9-8211-6856d8ff5b06 diz que a conta dele "tem coisa estranha" mas não sabe explicar o quê. Você decide investigar em 3 passos separados, cada um checando uma hipótese diferente sobre o que pode estar errado com ele.
SELECT *
FROM clientes
WHERE idCliente = '14d5f91d-a339-4ed9-8211-6856d8ff5b06';
SELECT *
FROM transacoes
WHERE idCliente = '14d5f91d-a339-4ed9-8211-6856d8ff5b06';

SELECT * FROM transacao_produto
WHERE IdTransacao = '0cd9eeba-3c8f-47c3-82f0-f857199adb33';

SELECT * FROM transacao_produto
WHERE IdTransacao = '5fe46260-bae9-42ec-842a-ec521db956ed';

SELECT * FROM transacao_produto
WHERE IdTransacao = 'fba0bf26-4e4c-4e5a-964c-e0679e4a3913';

-- essas foram as formas que encontrei puxando todos os dados dele existente 
