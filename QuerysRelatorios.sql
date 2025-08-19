--1. Listar todos os Clientes que não tenham realizado uma compra

SELECT c.*
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

--2. Listar os Produtos que não tenham sido comprados

SELECT p.*
FROM Produtos p
LEFT JOIN ItensPedido ip ON p.id_produto = ip.id_produto
WHERE ip.id_item IS NULL;


--3. Listar os Produtos sem Estoque

SELECT *
FROM Produtos
WHERE quantidade_estoque = 0;

--4. Agrupar a quantidade de vendas de uma determinada Marca por Loja

SELECT l.nome_loja, m.nome_marca, COUNT(*) AS total_vendas
FROM Pedidos p
JOIN ItensPedido ip ON p.id_pedido = ip.id_pedido
JOIN Produtos pr ON ip.id_produto = pr.id_produto
JOIN Marcas m ON pr.id_marca = m.id_marca
JOIN Lojas l ON p.id_loja = l.id_loja
WHERE m.nome_marca = 'TechMax'
GROUP BY l.nome_loja, m.nome_marca;

--5. Listar os Funcionários que não estejam relacionados a um Pedido

SELECT f.*
FROM Funcionarios f
LEFT JOIN Pedidos p ON f.id_funcionario = p.id_funcionario
WHERE p.id_pedido IS NULL;
