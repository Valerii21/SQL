SELECT * FROM database2.orders;
INSERT database2.orders(employeeid, price, orderstatus) 
VALUES 	("e03", 15.00, 'OPEN'),
		("e01", 25.50, 'OPEN'),
		("e05", 100.70, 'CLOSED'),
		("e02", 22.18, 'OPEN'),
		("e04", 9.50, 'CANCELLED'),
		("e04", 99.99, 'OPEN');

SELECT * FROM database2.orders;

SELECT idorderid, orderstatus,
CASE orderstatus
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM database2.orders;

/*
4. Чем NULL отличается от 0?
"0" — это значение, константа. 
A "NULL" указывает на "пустое место" — объявленную, но неинициализированную переменную, объект...
*/