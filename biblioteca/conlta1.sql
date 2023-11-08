create database Biblioteca; 

use Biblioteca;


-- Paso 1: Creación de la tabla

create table Libros (
ID int primary key not null auto_increment, 
Titulo varchar(25),
Autor varchar(25),
Anio int,
Editorial varchar(50)
);


-- Paso 2: Inserción de datos

insert into Libros(Titulo, Autor, Anio, Editorial) values 
('Caperucita Roja',  'Juan Lopez', '1990', 'Ingenio'),
('Hansel y Gretel', 'Maria Sanchez', '1996', 'Maravilla'),
('El señor de los anillos', 'Maria Sanchez', '2012', 'Ingenio'),
('Harry Potter', 'Jose Monteverde', '2004', 'Banana'),
('Los tres cerditos', 'Jose Valverde', '1888', 'Banana') 
;

-- Paso 3: Consulta de datos
select * from Libros;

-- a) Muestra todos los libros de la tabla Libros
select ID, Titulo from Libros;


-- b) Muestra los libros publicados después de 2010
select Anio, Titulo from Libros
where anio > '2010';

-- c) Muestra los libros escritos por un autor específico que elijas.
Select Titulo, Autor from Libros
where Autor = 'Maria Sanchez';


-- d) Muestra los libros publicados por una editorial específica que elijas.
select Titulo, Editorial from Libros 
where Editorial = 'Ingenio';


-- Paso 4: Eliminación de datos

-- Elimina un libro de la tabla Libros basado en un criterio que determines (por ejemplo,
-- el libro más antiguo o un libro específico por título).
delete from Libros 
where Titulo ='Los tres cerditos';

select * from Libros;


-- Paso 5: Desafío adicional (opcional)

-- Agrega al menos dos libros más a la tabla
insert into Libros (Titulo, Autor, Anio, Editorial) values 
('La Divina Comedia', 'Dante', ' 2008', 'Manzanita'),
('El Principito', 'Antonie', '2018', 'Ingenio'); 

select * from Libros;


-- Realiza una consulta que combine múltiples condiciones utilizando AND y OR. Por
-- ejemplo, muestra los libros escritos por un autor específico y publicados después de
-- cierto año.
select Titulo, anio from Libros 
where Autor = 'Maria Sanchez' and  anio > '2010';
