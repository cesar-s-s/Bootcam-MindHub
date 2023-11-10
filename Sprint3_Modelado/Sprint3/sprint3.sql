create database Sprint3;

Use Sprint3;

CREATE TABLE Salesman (
    salesman_id INT NOT NULL,
    name VARCHAR(24),
    city VARCHAR(24),
    commission decimal(4,2),
    PRIMARY KEY (salesman_id)
);
-- **** 4 digitos en total con 2 decimales. Es decir: 12,28 ****


CREATE TABLE Customer (
    customer_id INT NOT NULL,
    cust_name VARCHAR(24),
    city VARCHAR(24),
    grade INT,
    PRIMARY KEY (customer_id),
    
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);



CREATE TABLE Orders (
	ord_no INT NOT NULL,
    purch_amt DECIMAL(6,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    primary key (ord_no),
	
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

-- drop table Customer;

-- drop table Orders;


-- *** Si quiero alterar la tabla y agregar las Foreign Key ****

-- ALTER TABLE Orders
-- ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

-- ALTER TABLE Orders
-- ADD FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id);


insert into Salesman (salesman_id, name, city, commission) values 
('5001', 'James Hoog', 'New York', '0.15'),
('5002', 'Nail Knite', 'Paris', '0.13'),
('5005', 'Pit Alex', 'London', '0.11'),
('5006', 'Mc Lyon', 'Paris', '0.14'),
('5007', 'Paul Adam', 'Rome', '0.13'),
('5003', 'Lauson Hen', 'San Joe', '0.12');


insert into Customer (customer_id, cust_name, city, grade, salesman_id) values 
('3002', 'Nick Rimando', 'New York', '100','5001' ),
('3007', 'Brad Davis', 'New York', '200','5001'),
('3005', 'Graham Zusi', 'California', '200','5002'),
('3008', 'Julian Green', 'London', '300','5002'),
('3004', 'Fabian Johnson', 'Paris', '300','5006'),
('3009', 'Geoff Cameron', 'Berlin', '100','5003'),
('3003', 'Jozv Altidor', 'Moscow', '200','5007');


insert into Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values 
('70001', '150.5', '2012-10-05', '3005','5002' ),
('70002', '65.26', '2012-10-05', '3005','5005'),
('70004', '110.5', '2012-08-17', '3009','5003'),
('70007', '948.5', '2012-09-10', '3005','5002'),
('70005', '2400.6', '2012-07-27', '3007','5001'),
('70008', '5760', '2012-09-10', '3002','5001');

-- drop table Orders;
-- drop database sprint3;

-- De las siguientes tablas escriba una consulta SQL para encontrar aquellos pedidos
-- cuyo monto del pedido esté entre 500 y 2000. Devolver ord_no, purch_amt,
-- cust_name, city.

-- select * from Salesman;
select * from Customer;
select * from Orders;

SELECT Ord.ord_no, Ord.purch_amt, Cus. cust_name, Cus.city 
FROM Orders Ord 
JOIN Customer Cus ON Ord.customer_id = Cus.customer_id
WHERE Ord.purch_amt BETWEEN 500 AND 2000;

