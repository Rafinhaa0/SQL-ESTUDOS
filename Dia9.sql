--🔴 TEMA 1 - TRABALHANDO COM NULL (Todas as tabelas)
--1. Liste todas as montadoras que NÃO têm nome cadastrado (tabela montadora).
SELECT * FROM montadora
WHERE nome_montadora IS NULL;

--2. Mostre os clientes que NÃO têm data de nascimento na tabela cliente.
SELECT * fROM cliente
WHERE nascimento IS NULL;

--3. Encontre os carros que NÃO têm ano cadastrado (tabela carro_cliente).
SELECT * FROM carro_cliente
WHERE ano IS NULL;

--4. Liste os clientes que NÃO têm idioma cadastrado (tabela idiomas).
SELECT * FROM idiomas
WHERE idioma IS NULL;

--5. Mostre os registros da tabela base que têm cidade NÃO nula.
SELECT * FROM base
WHERE cidade IS NULL;

--6. Encontre os clientes que têm empresa cadastrada NA tabela cliente.
SELECT * fROM cliente
WHERE empresa IS NOT NULL;

--7. Liste os países que têm nome preenchido (tabela pais).
SELECT * FROM pais
WHERE nome_pais IS NOT NULL;

--8. Mostre os clientes que têm profissão NÃO nula E cidade NÃO nula.
SELECT * FROM cliente
WHERE id_profissao IS NOT NULL AND cidade IS NOT NULL;

-- NÃO TEM NADA DE NULL NESSAS TABELAS ENTAO NAO DA PRA SABER SE TA CERTO OU NAO

--🔴 TEMA 2 - BETWEEN (Todas as tabelas)
--9. Liste os carros com ano entre 2015 e 2020 (tabela carro_cliente).
SELECT * FROM carro_cliente
WHERE ano BETWEEN 2015 AND 2020;

--10. Mostre os clientes com id_cliente entre 50 e 150 (tabela cliente).
SELECT * FROM cliente
WHERE id_cliente BETWEEN 50 AND 150;


--11. Encontre as montadoras com id_montadora entre 2 e 6 (tabela montadora).
SELECT * FROM montadora
WHERE id_montadora BETWEEN 2 AND 6;


--12. Liste os países com código entre 'B' e 'E' (tabela pais).
SELECT * fROM pais 
WHERE codigo_pais BETWEEN 'B' AND 'E'; 

--13. Mostre as profissões com id_profissao entre 1 e 4 (tabela profissao).
SELECT * FROM profissao
WHERE id_profissao BETWEEN 1 AND 4;


--14. Liste os idiomas com id_cliente entre 100 e 200 (tabela idiomas).
SELECT * fROM idiomas
WHERE id_cliente BETWEEN 100 AND 200;

--15. Encontre os registros da tabela base com id entre 10 e 50.
SELECT * FROM base 
WHERE id BETWEEN 10 AND 50;


--16. Mostre os carros com ano entre 2000 e 2010 na tabela carro_cliente.

SELECT * FROM carro_cliente
WHERE ano BETWEEN 2000 AND 2010;

--🟡 TEMA 3 - LIKE (Todas as tabelas)
--17. Liste as montadoras cujo nome comece com "F" (tabela montadora).
SELECT * FROM montadora
WHERE nome_montadora LIKE 'F%';

--18. Mostre os clientes cujo email termine com ".br" (tabela cliente).
SELECT * FROM cliente
WHERE email LIKE '%.br';

--19. Encontre os países cujo nome contenha "A" (tabela pais).
SELECT * FROM pais
WHERE nome_pais LIKE '%A%';

--20. Liste as profissões cujo nome comece com "A" OU "E" (tabela profissao).
SELECT * FROM profissao
WHERE ( nome_profissao LIKE 'A%' OR nome_profissao LIKE 'E%' );

--21. Mostre os clientes cujo primeiro_nome tenha exatamente 5 letras (tabela cliente).
SELECT * fROM cliente
WHERE primeiro_nome LIKE '_____';
--22. Liste as montadoras cujo nome termine com "a" (tabela montadora).
SELECT * fROM montadora
WHERE nome_montadora LIKE '%A';

--23. Encontre os clientes cujo email contenha "gmail" (tabela cliente).
SELECT * fROM cliente
WHERE email LIKE '%gmail%';

--24. Mostre os países cujo nome tenha a letra "o" na segunda posição (tabela pais).
SELECT * fROM pais
WHERE nome_pais LIKE '_O%'
--25. Liste as profissões cujo nome contenha "or" em qualquer posição (tabela profissao)
SELECT * FROM profissao
WHERE nome_profissao LIKE '%OR%';

--🟡 TEMA 4 - PARÊNTESES COM AND/OR (Todas as tabelas)
--26. Liste clientes do Brasil OU da Argentina, E que tenham profissão ID = 3 
--(tabela cliente).

SELECT * FROM cliente
WHERE (codigo_pais = 'BR' OR  codigo_pais = 'AR') 
AND id_profissao = 3;

--27. Mostre carros com ano >= 2020 OU ano <= 2010, E que sejam do 
--cliente com ID = 5 (tabela carro_cliente).
SELECT * FROM carro_cliente
where (ano >= 2020 OR ano <= 2010) 
AND id_cliente = 5;


--28. Encontre clientes com primeiro_nome começando com "A" OU "B", E ultimo_nome
--começando com "S" (tabela cliente).
SELECT * fROM cliente
WHERE (primeiro_nome LIKE 'A%' OR primeiro_nome LIKE 'B%')
AND ultimo_nome LIKE 'S%';

--29. Liste países com código 'BR' OU 'US', E que tenham nome preenchido 
--(tabela pais).
SELECT * FROM pais
WHERE (codigo_pais = 'BR' OR codigo_pais = 'US')
AND nome_pais IS NOT NULL;

--30. Mostre profissões com ID = 1 OU ID = 2, E que tenham nome preenchido 
--(tabela profissao).
SELECT * FROM profissao
WHERE (id_profissao = 1 OR id_profissao = 2)
AND nome_profissao IS NOT NULL;

--31. Liste clientes do Brasil OU que tenham empresa = 'TechCorp', 
--E que tenham email não nulo (tabela cliente).
SELECT * fROM cliente
WHERE (codigo_pais = 'BR' OR empresa LIKE '%TechCorp%')
AND email IS NOT NULL; 

--32. Mostre carros com ano = 2018 OU ano = 2019, E que tenham cliente com 
--ID > 50 (tabela carro_cliente).
SELECT * FROM carro_cliente
WHERE (ano = 2018 OR ano = 2019)
AND id_carro > 50;

--33. Encontre montadoras com nome começando com "H" OU "T", E que tenham ID entre
--1 e 5 (tabela montadora).
SELECT * fROM montadora
WHERE (nome_montadora LIKE 'H%' OR nome_montadora LIKE 'T%')
AND id_montadora BETWEEN 1 AND 5;

--🔴 TEMA 5 - GROUP BY (Todas as tabelas)
--34. Agrupe por ano na tabela carro_cliente e mostre quantos carros 
--têm em cada ano. Mostre o ano no SELECT.
SELECT 
ANO,
COUNT(ANO) AS TOTAL
FROM carro_cliente
GROUP BY ano
ORDER BY COUNT(ANO) DESC;

--35. Agrupe por id_cliente na tabela idiomas e mostre quantos idiomas cada
--cliente fala. Mostre o id_cliente.
-- ESSA NAO FAZ SENTIDO PQ CADA CLIENTE SÓ FALA 1 IDIOMA
-- UNICA COISA QUE DA PRA FAZER É CALCULAR QUANTOS CLIENTES FALA CADA LINGUA 

SELECT 
idioma,
COUNT(idioma) AS CLIENTES 
FROM idiomas
GROUP BY idioma



--36. Agrupe por codigo_pais na tabela cliente e mostre a contagem de 
--clientes por país.
SELECT 
codigo_pais,
COUNT(codigo_pais) AS TOTAL 
fROM cliente
GROUP BY codigo_pais


--37. Agrupe por id_profissao na tabela cliente e mostre a contagem 
--de clientes por profissão.

SELECT 
id_profissao,
COUNT(id_profissao) AS TOTAL
fROM cliente
GROUP BY id_profissao
ORDER BY COUNT(id_profissao) DESC;


--38. Agrupe por id_montadora na tabela carro_montadora e mostre quantos 
--carros cada montadora tem.
SELECT 
id_montadora,
COUNT(id_montadora) AS TOTAL_CARROS
fROM carro_montadora
GROUP BY id_montadora
ORDER BY COUNT(id_montadora) DESC;


--39. Agrupe por id_carro na tabela carro_cliente e mostre quantos clientes
--têm cada carro.


SELECT 
id_carro,
COUNT(id_carro) AS TOTAL 
fROM carro_cliente
GROUP BY id_carro
ORDER BY COUNT(id_carro) DESC;

--40. Agrupe por cidade na tabela cliente e mostre a contagem de clientes
--por cidade.
SELECT
cidade,
COUNT(cidade) AS TOTAL 
fROM cliente
GROUP BY cidade
ORDER BY COUNT(cidade) DESC;

--41. Agrupe por id_cliente na tabela carro_cliente e mostre quantos carros
--cada cliente tem.
-- AQUI NAO FAZ SENTIDO PQ CADA ID_CLIENTE É UNICO 
--SÓ DA PRA FAZER IGUAL AQUELE OUTRO EX QUE EU MUDEI TBM VENDO QUANTOS DE CLIENTES TEM OS ID_CARROS


✅ CORREÇÃO - TEMA 1 a 5
🔴 TEMA 1 - TRABALHANDO COM NULL
1. ✅ CORRETO

sql
SELECT * FROM montadora
WHERE nome_montadora IS NULL;
2. ✅ CORRETO (mas verifique o nome da coluna)

sql
SELECT * FROM cliente
WHERE nascimento IS NULL;
⚠️ Verifique: O nome da coluna pode ser data_nascimento ou nascimento. Confirme no seu banco.

3. ✅ CORRETO

sql
SELECT * FROM carro_cliente
WHERE ano IS NULL;
4. ❌ ERRADO - O exercício pede "clientes que NÃO têm idioma"

sql
-- ❌ Você fez:
SELECT * FROM idiomas WHERE idioma IS NULL;

-- ✅ Correto (clientes que NÃO aparecem na tabela idiomas):
SELECT * FROM cliente
WHERE id_cliente NOT IN (SELECT id_cliente FROM idiomas);
Explicação: A tabela idiomas só tem clientes que têm idioma. Para achar quem NÃO tem, precisa ver quem está fora dessa tabela.

5. ❌ ERRADO - O exercício pede "têm cidade NÃO nula"

sql
-- ❌ Você fez (trouxe quem tem NULL):
SELECT * FROM base WHERE cidade IS NULL;

-- ✅ Correto:
SELECT * FROM base
WHERE cidade IS NOT NULL;
6. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE empresa IS NOT NULL;
7. ✅ CORRETO

sql
SELECT * FROM pais
WHERE nome_pais IS NOT NULL;
8. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE id_profissao IS NOT NULL AND cidade IS NOT NULL;
Observação: Você disse "NÃO TEM NADA DE NULL" - isso é comum em dados de exemplo. O importante é você saber a sintaxe correta.

🔴 TEMA 2 - BETWEEN
9. ✅ CORRETO

sql
SELECT * FROM carro_cliente
WHERE ano BETWEEN 2015 AND 2020;
10. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE id_cliente BETWEEN 50 AND 150;
11. ✅ CORRETO

sql
SELECT * FROM montadora
WHERE id_montadora BETWEEN 2 AND 6;
12. ✅ CORRETO

sql
SELECT * FROM pais 
WHERE codigo_pais BETWEEN 'B' AND 'E';
13. ✅ CORRETO

sql
SELECT * FROM profissao
WHERE id_profissao BETWEEN 1 AND 4;
14. ✅ CORRETO

sql
SELECT * FROM idiomas
WHERE id_cliente BETWEEN 100 AND 200;
15. ✅ CORRETO

sql
SELECT * FROM base 
WHERE id BETWEEN 10 AND 50;
16. ✅ CORRETO

sql
SELECT * FROM carro_cliente
WHERE ano BETWEEN 2000 AND 2010;
🟡 TEMA 3 - LIKE
17. ✅ CORRETO

sql
SELECT * FROM montadora
WHERE nome_montadora LIKE 'F%';
18. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE email LIKE '%.br';
19. ✅ CORRETO

sql
SELECT * FROM pais
WHERE nome_pais LIKE '%A%';
⚠️ Dica: LIKE é case-sensitive em alguns SGBDs. Use %A% ou %a% dependendo dos seus dados.

20. ✅ CORRETO

sql
SELECT * FROM profissao
WHERE (nome_profissao LIKE 'A%' OR nome_profissao LIKE 'E%');
21. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE primeiro_nome LIKE '_____';
22. ❌ ERRADO - Maiúscula vs Minúscula

sql
-- ❌ Você fez (termina com A maiúsculo):
WHERE nome_montadora LIKE '%A';

-- ✅ Correto (termina com "a" minúsculo):
SELECT * FROM montadora
WHERE nome_montadora LIKE '%a';
Explicação: O exercício pede termine com "a" (minúsculo), não "A" (maiúsculo).

23. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE email LIKE '%gmail%';
24. ⚠️ PROBLEMA DE CASE

sql
-- Você fez:
WHERE nome_pais LIKE '_O%'

-- ✅ Correto (se for case-sensitive, use minúsculo):
SELECT * FROM pais
WHERE nome_pais LIKE '_o%';
Explicação: O exercício pede letra "o" minúscula na segunda posição.

25. ⚠️ PROBLEMA DE CASE

sql
-- Você fez:
WHERE nome_profissao LIKE '%OR%';

-- ✅ Correto:
SELECT * FROM profissao
WHERE nome_profissao LIKE '%or%';
Explicação: O exercício pede "or" minúsculo.

🟡 TEMA 4 - PARÊNTESES COM AND/OR
26. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE (codigo_pais = 'BR' OR codigo_pais = 'AR') 
AND id_profissao = 3;
27. ✅ CORRETO

sql
SELECT * FROM carro_cliente
WHERE (ano >= 2020 OR ano <= 2010) 
AND id_cliente = 5;
28. ✅ CORRETO

sql
SELECT * FROM cliente
WHERE (primeiro_nome LIKE 'A%' OR primeiro_nome LIKE 'B%')
AND ultimo_nome LIKE 'S%';
29. ✅ CORRETO

sql
SELECT * FROM pais
WHERE (codigo_pais = 'BR' OR codigo_pais = 'US')
AND nome_pais IS NOT NULL;
30. ✅ CORRETO

sql
SELECT * FROM profissao
WHERE (id_profissao = 1 OR id_profissao = 2)
AND nome_profissao IS NOT NULL;
31. ⚠️ PROBLEMA - Você usou LIKE onde não precisa

sql
-- ❌ Você fez:
WHERE (codigo_pais = 'BR' OR empresa LIKE '%TechCorp%')

-- ✅ Correto:
SELECT * FROM cliente
WHERE (codigo_pais = 'BR' OR empresa = 'TechCorp')
AND email IS NOT NULL;
Explicação: O exercício pede empresa = 'TechCorp' (exato), não "contém" TechCorp.

32. ❌ ERRADO - Filtro errado

sql
-- ❌ Você fez (filtrou por id_carro > 50):
WHERE (ano = 2018 OR ano = 2019) AND id_carro > 50;

-- ✅ Correto (filtro é id_cliente > 50):
SELECT * FROM carro_cliente
WHERE (ano = 2018 OR ano = 2019)
AND id_cliente > 50;
33. ✅ CORRETO

sql
SELECT * FROM montadora
WHERE (nome_montadora LIKE 'H%' OR nome_montadora LIKE 'T%')
AND id_montadora BETWEEN 1 AND 5;
🔴 TEMA 5 - GROUP BY
34. ✅ CORRETO

sql
SELECT 
ANO,
COUNT(ANO) AS TOTAL
FROM carro_cliente
GROUP BY ano
ORDER BY COUNT(ANO) DESC;
35. ⚠️ VOCÊ TEM RAZÃO, MAS PODERIA SER OUTRA COISA

sql
-- Você disse: "CADA CLIENTE SÓ FALA 1 IDIOMA"
-- Você fez:
SELECT 
idioma,
COUNT(idioma) AS CLIENTES 
FROM idiomas
GROUP BY idioma
✅ Sua solução está correta para o que você identificou. Mas o exercício original pedia:

sql
-- Original (se cada cliente pudesse ter vários idiomas):
SELECT 
id_cliente,
COUNT(idioma) AS QTD_IDIOMAS
FROM idiomas
GROUP BY id_cliente;
Sua solução (contar por idioma) também é válida e faz sentido!

36. ✅ CORRETO

sql
SELECT 
codigo_pais,
COUNT(codigo_pais) AS TOTAL 
FROM cliente
GROUP BY codigo_pais;
37. ✅ CORRETO

sql
SELECT 
id_profissao,
COUNT(id_profissao) AS TOTAL
FROM cliente
GROUP BY id_profissao
ORDER BY COUNT(id_profissao) DESC;
38. ✅ CORRETO

sql
SELECT 
id_montadora,
COUNT(id_montadora) AS TOTAL_CARROS
FROM carro_montadora
GROUP BY id_montadora
ORDER BY COUNT(id_montadora) DESC;
39. ✅ CORRETO

sql
SELECT 
id_carro,
COUNT(id_carro) AS TOTAL 
FROM carro_cliente
GROUP BY id_carro
ORDER BY COUNT(id_carro) DESC;
40. ✅ CORRETO

sql
SELECT
cidade,
COUNT(cidade) AS TOTAL 
FROM cliente
GROUP BY cidade
ORDER BY COUNT(cidade) DESC;
41. ⚠️ VOCÊ ESTÁ PARCIALMENTE CERTO

sql
-- Você disse: "AQUI NAO FAZ SENTIDO PQ CADA ID_CLIENTE É UNICO"
-- E sugeriu: "VENDO QUANTOS DE CLIENTES TEM OS ID_CARROS"
Explicação: Na verdade faz sentido SIM!

A tabela carro_cliente tem vários registros para o mesmo id_cliente (um cliente pode ter vários carros)

Então agrupar por id_cliente mostra QUANTOS CARROS cada cliente tem

Solução correta:

sql
SELECT 
id_cliente,
COUNT(id_carro) AS QUANTIDADE_CARROS
FROM carro_cliente
GROUP BY id_cliente
ORDER BY COUNT(id_carro) DESC;
📊 RESUMO DOS ERROS
Exercício	Erro	Correção
4	Pensou em NULL na tabela idiomas	Usar NOT IN para achar quem NÃO tem
5	Inverteu a lógica (IS NULL em vez de IS NOT NULL)	Usar IS NOT NULL
22	Usou maiúscula 'A' em vez de 'a'	Usar '%a'
24	Usou maiúscula 'O' em vez de 'o'	Usar '_o%'
25	Usou maiúscula 'OR' em vez de 'or'	Usar '%or%'
31	Usou LIKE onde era =	Usar = 'TechCorp'
32	Filtrou id_carro em vez de id_cliente	Filtrar id_cliente > 50
41	Achou que não fazia sentido	Faz sentido sim!
Aproveitamento: 35/41 = 85% 🎯

Continue assim! Quando terminar os outros, me manda que corrijo! 💪
