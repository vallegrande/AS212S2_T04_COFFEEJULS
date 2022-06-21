/* Crear base de datos dbCofeeJuls */
DROP DATABASE dbcofeejuls;


/* Crear base de datos dbCofeeJuls */
CREATE DATABASE dbCofeeJuls;

/* Poner en uso dbCofeeJuls */
USE dbCofeeJuls;

/*------ Creacion de tablas ------*/

/* Crear tabla CATEGORÍA */
CREATE TABLE CATEGORIA
(
    CODCAT char(6),
    NOMCAT varchar(60),
    CONSTRAINT CODCAT_PK PRIMARY KEY (CODCAT)
);

/* Crear tabla UBIGEO */
CREATE TABLE UBIGEO
(
    CODUBI char(6),
    DEPUBI varchar(80),
    PROVUBI varchar(80),
    DISTUBI varchar(80),
    CONSTRAINT CODUBI_PK PRIMARY KEY (CODUBI)
);

/* Crear tabla PRODUCTO */
CREATE TABLE PRODUCTO
(
    CODPRO char(6),
    NOMPRO varchar(50),
    PREPRO decimal(8,2),
    STOCKPRO int,
    CODCAT char(6),
    CONSTRAINT CODPRO_PK PRIMARY KEY (CODPRO)
);

/* Crear tabla VENDEDOR */
CREATE TABLE VENDEDOR
(
    CODVEND char(6),
    NOMVEND varchar(50),
    APEVEND varchar(50),
    DNIVEND char(8),
    CELVEND char(9),	
    /*SEXVEND CHAR(1)*/
    DOMVEND varchar(80),
    UBIVEND char(6),
    
    CONSTRAINT CODVEND_PK PRIMARY KEY (CODVEND)
);

/* Crear tabla VENTA */

CREATE TABLE VENTA
(
    IDVENT int AUTO_INCREMENT,
    FECVENT date,
    CODVEND char(6),
    CODCLI char(6),
    TIPVENT char(1),
    CONSTRAINT IDVENT_PK PRIMARY KEY (IDVENT)
);

/* Crear tabla CLIENTE */
CREATE TABLE CLIENTE
(
    CODCLI char(6),
    DNICLI char(8),
    NOMCLI varchar(40),
    APECLI varchar(80),
    CELCLI char(9),
    EMACLI varchar(50),
    FECNACCLI date,
    UBICLI char(6),
    
    CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

/* Crear tabla VENTA_DETALLE */
CREATE TABLE VENTA_DETALLE
(
    IDVENTDET int AUTO_INCREMENT,
    IDVENT int,
    CODPRO char(6),
    CANTVENTDET int,
    CONSTRAINT IDVENTDET_PK PRIMARY KEY (IDVENTDET)
);

/*------ RELACIONAR LAS OTRAS TABLAS ------*/

/* Relacionar CLIENTE - UBIGEO */
ALTER TABLE CLIENTE
	ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY (UBICLI) REFERENCES UBIGEO (CODUBI);
    
/* Relacionar VENDEDOR - UBIGEO */
ALTER TABLE VENDEDOR
	ADD CONSTRAINT VENDEDOR_UBIGEO FOREIGN KEY (UBIVEND) REFERENCES UBIGEO (CODUBI);

/* Relacionar PRODUCTO - CATEGORIA */
ALTER TABLE PRODUCTO
	ADD CONSTRAINT PRODUCTO_CATEGORIA FOREIGN KEY (CODCAT) REFERENCES CATEGORIA (CODCAT);

/* Relacionar VENTA - CLIENTE */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI);

/* Relacionar VENTA - VENDEDOR */
ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (CODVEND) REFERENCES VENDEDOR (CODVEND);

/* Relacionar VENTA_DETALLE - VENTA */
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (IDVENT) REFERENCES VENTA (IDVENT);

/* Relacionar VENTA_DETALLE - PRODUCTO */
ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_PRODUCTO FOREIGN KEY (CODPRO) REFERENCES PRODUCTO (CODPRO);


/* Listar tablas de la base de datos */
SHOW TABLES FROM dbcofeejuls;

/* Insertar registros CATEGORIA */
INSERT INTO CATEGORIA
(CODCAT, NOMCAT)
VALUES
('CA0001', 'Bebidas'),
('CA0002', 'Postres'),
('CA0003', 'Comida rapida'),
('CA0004', 'Especiales');



/* Insertar registros en la tabla UBIGEO */
INSERT INTO UBIGEO
(CODUBI, DEPUBI, PROVUBI, DISTUBI)
VALUES
('140401', 'Lima', 'Cañete', 'San Vicente de Cañete'),
('140402', 'Lima', 'Cañete', 'Calango'),
('140403', 'Lima', 'Cañete', 'Cerro Azul'),
('140404', 'Lima', 'Cañete', 'Coayllo'),
('140405', 'Lima', 'Cañete', 'Chilca'),
('140406', 'Lima', 'Cañete', 'Imperial'),
('140407', 'Lima', 'Cañete', 'Lunahuaná'),
('140408', 'Lima', 'Cañete', 'Mala'),
('140409', 'Lima', 'Cañete', 'Nuevo Imperial'),
('140410', 'Lima', 'Cañete', 'Pacarán'),
('140411', 'Lima', 'Cañete', 'Quilmaná'),
('140412', 'Lima', 'Cañete', 'San Antonio'),
('140413', 'Lima', 'Cañete', 'San Luis'),
('140414', 'Lima', 'Cañete', 'Santa Cruz de Flores'),
('140415', 'Lima', 'Cañete', 'Zúñiga'),
('140416', 'Lima', 'Cañete', 'Asia');

/* Insertar registro tabla CLIENTE */
INSERT INTO CLIENTE
(CODCLI, NOMCLI, APECLI, CELCLI, EMACLI, FECNACCLI, UBICLI)
VALUES
('CL0001','Alicia','García Campos','929185236','agarcia@gmail.com','1977/01/01','140409'),
('CL0002','Juana','Ávila Chumpitaz','923568741','javila@gmail.com','1980/07/15','140402'),
('CL0003','Oscar','Coronado Vásquez','932615478','ocoronado@gmail.com','1975/06/12','140403'),
('CL0004','Luis','Barrios Palomino','932817645','lbarrios@outlook.com','1981/03/24','140409'),
('CL0005','María','Tarazona Mendoza','978400123','mtarazona@outlook.com','1975/08/16','140407'),
('CL0006','Pedro','Sánchez Dávila','941533268','psanchez@yahoo.com','1970/09/10','140402'),
('CL0007','Aldo','Torres Zavala','958866221','atorres@yahoo.com','1980/02/20','140405'),
('CL0008','Fiorella','Monteza Alzamora','992255441','fmonteza@gmail.com','1979/04/30','140408'),
('CL0009','Gloria','Linares Rodríguez','954415950','glinares@hotmail.com','1981/09/23','140403'),
('CL0010','Esperanza','Stark Parker','901133258','estark@yahoo.com','1978/10/24','140405');



/* Insertar registros tabla PRODUCTO */
INSERT INTO PRODUCTO
(CODPRO, NOMPRO, PREPRO, STOCKPRO, CODCAT)
VALUES
('P00001', 'Café', 2.50, 50, 'CA0001'),
('P00002', 'Cupcakes', 2.50, 60, 'CA0002'),
('P00003', 'Pancakes', 2.80, 50, 'CA0002'),
('P00004', 'Sandwiches', 1.50, 90, 'CA0003'),
('P00005', 'Churros', 2.50, 30, 'CA0002'),
('P00006', 'Pizza', 5.00, 25, 'CA0003'),
('P00007', 'Waffles', 7.50, 90, 'CA0002');



/* Listar registros tabla VENDEDOR */
INSERT INTO VENDEDOR
(CODVEND, NOMVEND, APEVEND, DNIVEND, CELVEND, DOMVEND, UBIVEND)
VALUES
('V00001','Alberto','Solano Pariona','77889955','99845632','Av. Miraflores','140405'),
('V00002','Ana','Enriquez Flores','22116633','978848551','Calle Los Libertadores','140407'),
('V00003','Carolina','Rojas Urrutia','66771144','916431258','Jr. José Olaya','140402');

/*Consultar el codigo del vendedor y cliente*/
select CODVEND from vendedor ;
select CODCLI from cliente ;

/* ------- Insertar las ventas -------*/

/* Insertar la primera venta 1 */
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2022/12/21','V00002','CL0001','D');

/* Insertar la segunda venta 2 */
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2022/01/11','V00001','CL0003','R');

/* Insertar la tercera venta 3 */
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2022/03/05','V00001','CL0004','D');

/* Insertar la cuarta venta 4*/
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2022/02/22','V00002','CL0004','R');

/* Insertar la quinta venta 5*/
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2022/03/02','V00002','CL0004','D');

/* Insertar la sexta venta 6*/
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2022/04/07','V00003','CL0004','R');

/* ------- Insertar detalles a las ventas -------*/

/* Insertar detalles de la VENTA 1 */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(1, 'P00001', 5);

/* Insertar detalles de la VENTA 2 */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(2, 'P00003', 7),
(2, 'P00005', 3),
(2, 'P00007', 3),
(2, 'P00002', 6);

/* Insertar la tercera VENTA 3 */
INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('2021/03/05','V00001','CL0004','D');

/* Insertar detalles de la VENTA 4 */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(4, 'P00002', 10),
(4, 'P00003', 5),
(4, 'P00001', 4),
(4, 'P00004', 8);

/* Insertar detalles de la VENTA 5 */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(5, 'P00001', 8);

/* Insertar detalles de la VENTA 6 */
INSERT INTO VENTA_DETALLE
(IDVENT, CODPRO, CANTVENTDET)
VALUES
(6, 'P00004', 1),
(6, 'P00002', 2);

/*  ------ Listar VENTAS con sus respectivos DETALLES ------*/

/* Listar VENTA 1*/
SELECT * FROM VENTA WHERE IDVENT = 1;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 1;

/* Listar VENTA 2*/
SELECT * FROM VENTA WHERE IDVENT = 2;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 2;

/* Listar VENTA 3*/
SELECT * FROM VENTA WHERE IDVENT = 3;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 3;

/* Listar VENTA 4*/
SELECT * FROM VENTA WHERE IDVENT = 4;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 4;

/* Listar VENTA 5*/
SELECT * FROM VENTA WHERE IDVENT = 5;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 5;

/* Listar VENTA 6*/
SELECT * FROM VENTA WHERE IDVENT = 6;
SELECT * FROM VENTA_DETALLE WHERE IDVENT = 6;

/* ------ Listando registros de las tablas ------*/
SELECT * FROM UBIGEO;
SELECT * FROM PRODUCTO;
SELECT * FROM CLIENTE;
SELECT * FROM VENDEDOR; 
SELECT * FROM CATEGORIA;
SELECT * FROM VENTA;
SELECT * FROM VENTA_DETALLE;

/* ------ Ver estructuras ------*/
DESCRIBE VENTA;
DESCRIBE VENTA_DETALLE;
DESCRIBE VENDEDOR;
DESCRIBE CLIENTE;
DESCRIBE UBIGEO;
DESCRIBE CATEGORIA;
DESCRIBE PRODUCTO;


/* ------ Listar relaciones ------ */
SELECT 
  CONSTRAINT_NAME,
  `TABLE_NAME`,                            -- Foreign key table
  `COLUMN_NAME`,                           -- Foreign key column
  `REFERENCED_TABLE_NAME`,                 -- Origin key table
  `REFERENCED_COLUMN_NAME`                 -- Origin key column
FROM
  `INFORMATION_SCHEMA`.`KEY_COLUMN_USAGE`  -- Will fail if user don't have privilege
WHERE
  `TABLE_SCHEMA` = SCHEMA()                -- Detect current schema in USE 
  AND `REFERENCED_TABLE_NAME` IS NOT NULL; -- Only tables with foreign keys;






/* ///////////////  USUARIO/////////////////*/

/* Agregar columna ESTCLI estado del cliente A (activo) / I (inactivo) 
ALTER TABLE CLIENTE
	ADD ESTCLI CHAR(1) DEFAULT('A'); 
 */   
/* /////////////// COMRPROBAR /////////////////*/


/* /////////////// VENDEDOR /////////////////*/

/* Agregar campo ESTVEND donde A es activo / I es inactivo 
ALTER TABLE VENDEDOR
	ADD ESTVEND CHAR(1) DEFAULT('A'); -- A (activo) I (inactivo)
*/

/* /////////////// COMRPROBAR SI SE REALIZO BIEN ESTE PASO/////////////////*/


/* /////////////// COMRPROBAR SI SE REALIZO BIEN ESTE PASO/////////////////*/


/*AGREGANDO MAS DATOS*/

