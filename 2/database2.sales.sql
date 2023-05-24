# Задача 1. Используя операторы языка SQL, 
# создайте таблицу “sales”. Заполните ее данными.

SELECT * FROM database2.sales;
INSERT database2.sales(order_date, price) 
VALUES 	("2023-01-01", 150), 
		("2023-01-02", 250), 
		("2023-01-03", 30), 
		("2023-01-04", 450), 
		("2023-01-05", 65);
				
SELECT * FROM database2.sales;

# Задача 2.Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id, order_date, price,
CASE TRUE
    WHEN price < 100 THEN 'меньше 100'
    WHEN price >= 100 AND price <= 300 THEN '100-300'
    ELSE 'больше 300'
END AS order_size
FROM database2.sales;

# Задача 3. Создайте таблицу “orders”, заполните ее значениями. 
# Покажите “полный” статус заказа, используя оператор CASE.

CREATE TABLE orders