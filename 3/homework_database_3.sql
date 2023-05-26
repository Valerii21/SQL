CREATE DATABASE  homework_database_3;
USE homework_database_3;

 CREATE TABLE salespeople (
  snum int(10),
  sname varchar(50),
  city varchar(50),
  comm varchar(50) 
  );
  
  insert salespeople(snum, sname, city, comm)
  values(1001, 'Peel', 'London', '.12'),
  (1002, 'Serres', 'San Jose', '.13'),
  (1004, 'Motika', 'London', '.11'),
  (1007, 'Rifkin', 'Barcelona', '.15'),
  (1003, 'Axelrod', 'New york', '.10');
  
  
-- 1.  Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
 
SELECT city, sname, snum, comm FROM salespeople;
SELECT * FROM salespeople;
-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)

CREATE TABLE customers (
  cnum int,
  cname varchar(50),
  city varchar(50),
  rating int,
  snum int
  );

 insert customers(cnum, cname, city, rating, snum)
  values(2001, 'hoofman', 'London', 100, 1001),
  (2002, 'Giovanni', 'Rome', 200, 1001),
  (2003, 'Liu', 'SanJose', 200, 1002),
  (2004, 'Grass', 'Berlin', 300, 1002),
  (2006, 'Clemans', 'London', 100, 1001),
  (2008, 'Cisneros', 'SanJose', 300, 1007),
  (2007, 'Pereira', 'Rome', 100, 1004);  
  
  SELECT cname, rating  FROM customers  WHERE city = 'SanJose';
  
  -- 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum, sname FROM salespeople;

-- 4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) 
SELECT * FROM customers WHERE cname LIKE 'G%';
-- 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
CREATE TABLE orders1 (
  onum int,
  amt int,
  odate date,
  cnum int,
  snum int
  );
    
  insert orders1(onum, amt, odate, cnum, snum)
  values(3001, 18.69, '1990-03-10', 2008, 1007),
		(3003, 767.19, '1990-03-10', 2001, 1001),
		(3002, 1900.10, '1990-03-10', 2007, 1004),
		(3005, 5160.45, '1990-03-10', 2003, 1002),
		(3006, 1098.16, '1990-03-10', 2008, 1007),
		(3009, 1713.23, '1990-04-10', 2002, 1003),
		(3007, 75.75, '1990-04-10', 2004, 1002),
		(3008, 4723.00, '1990-05-10', 2006, 1001),
		(3010, 1309.95, '1990-06-10', 2004, 1002),
		(3011, 9891.88, '1990-06-10', 2006, 1001);
SELECT * FROM orders1 WHERE amt>1000;

-- 6. Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT min(amt) AS Наименьшая_сумма_заказа FROM orders1;

-- 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * FROM customers where not city = 'Rome' and rating>100;

-- 8. Отсортируйте поле “зарплата” в порядке убывания и возрастания

create table staff (
	id int primary key auto_increment,
    name varchar (20) not null,
    surname varchar (20) not null,
    speciality varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);

insert staff( name, surname, speciality, seniority, salary, age)
values('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);


select *
from staff
order by salary;

select *
from staff
order by salary desc;

-- 9. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
select * From(select *
from staff
order by salary DESC
LIMIT 0,5)5_строк_с_наибольшей_заработной_платой
order by salary;

-- 10. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
SELECT speciality, count(*) AS speciality FROM staff
where salary > 100000
ORDER BY speciality
;
-- НЕ ПОЛУЧИЛОСЬ ПОСЛЕДНЕЕ!!!
