CREATE SCHEMA EMPRESA;
USE EMPRESA;
CREATE TABLE EMPLEADOS (
	EMP_ID int auto_increment,
    EMP_NOMBRE varchar(30),
    EMP_APELLIDO varchar(30),
    EMP_DNI int,
    EMP_TELEFONO int,
    EMP_DIRECCION varchar(30),
    EMP_FECHA_ALTA date,
    EMP_FECHA_NAC date,
    PRIMARY KEY(EMP_ID)
);

SELECT * FROM EMPLEADOS;

INSERT INTO EMPLEADOS (EMP_NOMBRE, EMP_APELLIDO, EMP_DNI, EMP_TELEFONO, EMP_DIRECCION, EMP_FECHA_ALTA, EMP_FECHA_NAC) VALUES 
("Carolina", "Herrera", "99999999", "1111111111", "Av. 9 de Julio 1111", "2002-07-26", "1998-06-06"),
("Juan", "Perez", "99999990", "1111111112", "Av. 9 de Julio 2222", "2000-10-31", "2020-10-31"),
("Sandra", "Perez", "99999991", "1111111113", "Av. 9 de Julio 3333", "2002-04-16", "2014-08-08");


INSERT INTO EMPLEADOS (EMP_NOMBRE, EMP_APELLIDO, EMP_DNI, EMP_TELEFONO, EMP_DIRECCION, EMP_FECHA_ALTA, EMP_FECHA_NAC) VALUES 
("Marcos", "Gimenez", "99999989", "1111111114", "Av. 9 de Julio 1144", "2006-02-26", "1988-06-06"),
("Manuel", "Gonzalez", "99999940", "1111111122", "Av. 9 de Julio 2288", "2010-8-30", "2020-10-02"),
("Carlos", "Perez", "99999881", "1111111132", "Av. 9 de Julio 3316", "2012-10-06", "2018-08-16"),
("Manuel", "Paredes", "99999992", "1111111102", "Av. 9 de Julio 4444", "2010-12-22", "2020-10-02"),
("Carolina", "Alonso", "99999912", "1111111136", "Av. 9 de Julio 3336", "2004-04-16", "2022-08-22");

SELECT * FROM EMPLEADOS;

-- AGREGO La columna "SALARIO" a la tabla EMPLEADOS
alter table EMPLEADOS add column Salario int;


-- Agrego datos de los salarios 

update EMPLEADOS set Salario = 200000 where EMP_ID = 1;
update EMPLEADOS set Salario = 210000 where EMP_ID = 2;
update EMPLEADOS set Salario = 120000 where EMP_ID = 3;
update EMPLEADOS set Salario = 180000 where EMP_ID = 4;
update EMPLEADOS set Salario = 260000 where EMP_ID = 5;
update EMPLEADOS set Salario = 280000 where EMP_ID = 6;
update EMPLEADOS set Salario = 220000 where EMP_ID = 7;
update EMPLEADOS set Salario = 220000 where EMP_ID = 8;


SELECT * FROM EMPLEADOS;


create table Rendimiento (
ID_Rend int not null auto_increment primary key,
Rend_Valor varchar (20)
);

SELECT * FROM Rendimiento;
 
INSERT INTO Rendimiento (Rend_valor) values 
('Excelente'),
('Muy bueno'),
('Bueno'),
('Malo');

-- delete from Rendimiento;

-- Vinculo la tabla Rendimiento con la de Empleado 
alter table EMPLEADOS add column id_Rendimiento Int, 
add foreign key (Id_Rendimiento) references Rendimiento(ID_Rend);

SELECT * FROM EMPLEADOS;


-- Actualizo la tabla empleados 
Update EMPLEADOS set id_Rendimiento=1 where EMP_ID=1;
Update EMPLEADOS set id_Rendimiento=2 where EMP_ID=2;
Update EMPLEADOS set id_Rendimiento=2 where EMP_ID=3;
Update EMPLEADOS set id_Rendimiento=3 where EMP_ID=4;
Update EMPLEADOS set id_Rendimiento=4 where EMP_ID=5;
Update EMPLEADOS set id_Rendimiento=4 where EMP_ID=6;
Update EMPLEADOS set id_Rendimiento=1 where EMP_ID=7;
Update EMPLEADOS set id_Rendimiento=1 where EMP_ID=8;

SELECT * FROM EMPLEADOS;



-- update tabla empleados en el campo salario, va a ser en base del rendimiento. Si el rendimiento es excelente aumenta 10% muy bueno 5%, bueno no aumentamos, regular o malo -5%
-- salario en empleado 
-- creo rendimiento 



SELECT * FROM Rendimiento;
SELECT * FROM EMPLEADOS;

-- Consulto si el rendimiento es Excelente, Muy bueno, bueon, malo
update Empleados set Salario = Salario*1.05 where id_rendimiento = 2;

update Empleados set Salario = Salario*1.1 where id_Rendimiento = ( select ID_Rend from Rendimiento where Rend_valor ='Excelente');

update Empleados set Salario = Salario*0.95 where id_Rendimiento = ( select ID_Rend from Rendimiento where Rend_valor ='Malo');



UPDATE EMPLEADOS SET EMP_APELLIDO = "Gonzalez" WHERE EMP_ID = 2;

UPDATE EMPLEADOS SET EMP_FECHA_ALTA = "2020-12-31" WHERE EMP_ID = 1;
UPDATE EMPLEADOS SET EMP_FECHA_NAC = "2000-12-31" WHERE EMP_ID = 1;

SELECT * FROM EMPLEADOS
WHERE EMP_APELLIDO = "Perez";

DELETE FROM EMPLEADOS WHERE EMP_ID = 3;