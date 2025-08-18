設問１
SELECT * FROM users;
設問２
SELECT * FROM users
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';
SELECT * FROM users
WHERE created_at LIKE '2024%';
設問３
SELECT * FROM users
WHERE age < 30 AND gender = 'female';
設問４
SELECT name, price FROM products;
設問５
SELECT users.name, orders.order_date
FROM orders
JOIN users ON orders.user_id = users.id;
設問６
SELECT 
  products.name AS 商品名,
  order_items.quantity AS 数量,
  order_items.unit_price AS 単価,
  order_items.quantity * order_items.unit_price AS 金額
FROM order_items
JOIN products ON order_items.product_id = products.id;
設問７
SELECT users.name AS ユーザー名, COUNT(orders.id) AS 注文件数
FROM users
LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.name;
設問８
SELECT users.name AS ユーザー名,
       SUM(order_items.quantity * order_items.unit_price) AS 総購入金額
FROM users
JOIN orders ON users.id = orders.user_id
JOIN order_items ON orders.id = order_items.order_id
GROUP BY users.name;
設問９
SELECT users.name AS ユーザー名,
       SUM(order_items.quantity * order_items.unit_price) AS 総購入金額
FROM users
JOIN orders ON users.id = orders.user_id
JOIN order_items ON orders.id = order_items.order_id
GROUP BY users.name
ORDER BY 総購入金額 DESC
LIMIT 1;
設問１０
SELECT products.name AS 商品名,
       SUM(order_items.quantity) AS 注文回数
FROM products
JOIN order_items ON products.id = order_items.product_id
GROUP BY products.name;
設問１１
SELECT users.name AS ユーザー名
FROM users
LEFT JOIN orders ON users.id = orders.user_id
WHERE orders.id IS NULL;
設問１２
SELECT order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(DISTINCT product_id) >= 2;
設問１３
SELECT DISTINCT users.name AS ユーザー名
FROM users
JOIN orders ON users.id = orders.user_id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE products.name = 'テレビ';
設問１４
SELECT 
  orders.order_date AS 注文日,
  users.name AS ユーザー名,
  products.name AS 商品名,
  order_items.quantity AS 数量,
  order_items.quantity * order_items.unit_price AS 合計金額
FROM order_items
JOIN orders ON order_items.order_id = orders.id
JOIN users ON orders.user_id = users.id
JOIN products ON order_items.product_id = products.id;
設問１５
SELECT products.name AS 商品名,
       SUM(order_items.quantity) AS 総数量
FROM products
JOIN order_items ON products.id = order_items.product_id
GROUP BY products.name
ORDER BY 総数量 DESC
LIMIT 1;
設問１６
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS 注文月,
  COUNT(*) AS 注文件数
FROM orders
GROUP BY 注文月
ORDER BY 注文月;
設問１７
SELECT products.name AS 商品名
FROM products
LEFT JOIN order_items ON products.id = order_items.product_id
WHERE order_items.id IS NULL;
設問１８
CREATE INDEX idx_product_id ON order_items(product_id);
設問１９
SELECT users.name AS ユーザー名,
       AVG(order_items.quantity * order_items.unit_price) AS 平均注文金額
FROM users
JOIN orders ON users.id = orders.user_id
JOIN order_items ON orders.id = order_items.order_id
GROUP BY users.name;
設問２０
SELECT orders.*
FROM orders
JOIN (
    SELECT user_id, MAX(order_date) AS latest_order_date
    FROM orders
    GROUP BY user_id
) AS latest_orders
ON orders.user_id = latest_orders.user_id
AND orders.order_date = latest_orders.latest_order_date;
設問２１
INSERT INTO users (name, age, gender, created_at)
VALUES ('中村愛', 25, '女性', '2025-06-01');
設問２２
INSERT INTO products (name, price)
VALUES ('エアコン', 60000);
設問２３
INSERT INTO orders (id, user_id, order_date)
VALUES (10, 1, '2025-06-10');
設問２４
INSERT INTO order_items (order_id, product_id, quantity)
VALUES (10, 6, 1);
設問２５
UPDATE users
SET age = 24
WHERE name = '田中美咲' AND age = 23;
設問２６
UPDATE products
SET price = price * 1.10;
設問２７
UPDATE orders
SET order_date = '2024-05-01'
WHERE order_date < '2024-05-01';
設問２８
DELETE FROM users
WHERE name = '高橋健一';
設問２９
DELETE FROM order_items
WHERE order_id = 5;
設問３０
DELETE FROM products
WHERE id NOT IN (
  SELECT DISTINCT product_id
  FROM order_items
);
DELETE FROM products
WHERE NOT EXISTS (
  SELECT 1
  FROM order_items
  WHERE order_items.product_id = products.id
);
