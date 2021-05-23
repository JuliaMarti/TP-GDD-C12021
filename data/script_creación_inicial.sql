USE [GD1C2021]
GO

/*
		---------------------- CREACION DEL ESQUEMA ----------------------
*/

IF(not exists(SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'GESTION_DE_GATOS'))
  	BEGIN
      	EXEC ('CREATE SCHEMA[GESTION_DE_GATOS]');
     	PRINT 'esquema creado';
    END


/*
		---------------------- CREACION DE TABLAS ----------------------
*/

--SUCURSAL
IF OBJECT_ID ('GESTION_DE_GATOS.SUCURSAL', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.SUCURSAL; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.SUCURSAL (
		SUCURSAL_MAIL NVARCHAR(255),
		SUCURSAL_DIRECCION NVARCHAR(255) NOT NULL,
		SUCURSAL_CIUDAD NVARCHAR(255) NOT NULL,
		SUCURSAL_TELEFONO DECIMAL(18,0) NOT NULL,
		PRIMARY KEY(SUCURSAL_MAIL)
	);
	PRINT 'Tabla SUCURSAL creada';
END

--CLIENTE
IF OBJECT_ID ('GESTION_DE_GATOS.CLIENTE', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.CLIENTE; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.CLIENTE (
		CLIENTE_DNI DECIMAL(18,0) NOT NULL,
		CLIENTE_MAIL NVARCHAR(255) NOT NULL,
		CLIENTE_APELLIDO NVARCHAR(255) NOT NULL,
		CLIENTE_NOMBRE NVARCHAR(255) NOT NULL,
		CLIENTE_FECHA_NACIMIENTO DATETIME2(3) NOT NULL,
		CLIENTE_TELEFONO INT NOT NULL,
		CLIENTE_DIRECCION NVARCHAR(255) NOT NULL,
		PRIMARY KEY(CLIENTE_DNI,CLIENTE_MAIL)
	);
	PRINT 'Tabla CLIENTE creada';
END

--FACTURA
IF OBJECT_ID ('GESTION_DE_GATOS.FACTURA', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.FACTURA; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.FACTURA (
		FACTURA_NUMERO DECIMAL(18,0),
		FECHA DATETIME2(3) NOT NULL,
		PRECIO DECIMAL(18,2) NOT NULL,
		CLIENTE_MAIL NVARCHAR(255) NOT NULL,
		CLIENTE_DNI DECIMAL(18,0) NOT NULL,
		SUCURSAL_MAIL NVARCHAR(255) NOT NULL,
		PRIMARY KEY(FACTURA_NUMERO)
	);
	PRINT 'Tabla FACTURA creada';
END


--ITEM_FACTURA_ACCESORIO
IF OBJECT_ID ('GESTION_DE_GATOS.ITEM_FACTURA_ACCESORIO', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.ITEM_FACTURA_ACCESORIO; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.ITEM_FACTURA_ACCESORIO (
		ITEM_NUMERO DECIMAL(18,0),
		FACTURA_NUMERO DECIMAL(18,0),
		PRECIO DECIMAL(18,2) NOT NULL,
		CANTIDAD DECIMAL(18,0) NOT NULL,
		ACCESORIO_CODIGO DECIMAL(18,0),
		PRIMARY KEY(ITEM_NUMERO,FACTURA_NUMERO)
	);
	PRINT 'Tabla ITEM_FACTURA_ACCESORIO creada';
END

--ITEM_FACTURA_PC
IF OBJECT_ID ('GESTION_DE_GATOS.ITEM_FACTURA_PC', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.ITEM_FACTURA_PC; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.ITEM_FACTURA_PC (
		ITEM_NUMERO DECIMAL(18,0),
		FACTURA_NUMERO DECIMAL(18,0),
		PRECIO DECIMAL(18,2) NOT NULL,
		CANTIDAD DECIMAL(18,0) NOT NULL,
		PC_ID DECIMAL(18,0),
		PRIMARY KEY(ITEM_NUMERO,FACTURA_NUMERO)
	);
	PRINT 'Tabla ITEM_FACTURA_PC creada';
END



--FABRICANTE
IF OBJECT_ID ('GESTION_DE_GATOS.FABRICANTE', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.FABRICANTE; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.FABRICANTE (
		FABRICANTE_ID DECIMAL(18,0),
		FABRICANTE_NOMBRE NVARCHAR(255) NOT NULL,
		PRIMARY KEY(FABRICANTE_ID)
	);
	PRINT 'Tabla FABRICANTE creada';
END



--COMPRA
IF OBJECT_ID ('GESTION_DE_GATOS.COMPRA', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.COMPRA; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.COMPRA (
		COMPRA_NUMERO DECIMAL(18,0),
		SUCURSAL_MAIL NVARCHAR(255) NOT NULL,
		COMPRA_FECHA DATETIME2(3) NOT NULL,
		COMPRA_PRECIO DECIMAL(18,2),
		PRIMARY KEY(COMPRA_NUMERO)
	);
	PRINT 'Tabla COMPRA creada';
END



--ITEM_COMPRA_ACCESORIO
IF OBJECT_ID ('GESTION_DE_GATOS.ITEM_COMPRA_ACCESORIO', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.ITEM_COMPRA_ACCESORIO; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.ITEM_COMPRA_ACCESORIO (
		ITEM_NUMERO DECIMAL(18,0),
		COMPRA_NUMERO DECIMAL(18,0),
		PRECIO DECIMAL(18,2) NOT NULL,
		CANTIDAD DECIMAL(18,0) NOT NULL,
		ACCESORIO_CODIGO DECIMAL(18,0),
		PRIMARY KEY(ITEM_NUMERO,COMPRA_NUMERO)
	);
	PRINT 'Tabla ITEM_COMPRA_ACCESORIO creada';
END


--ITEM_COMPRA_PC
IF OBJECT_ID ('GESTION_DE_GATOS.ITEM_COMPRA_PC', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.ITEM_COMPRA_PC; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.ITEM_COMPRA_PC (
		ITEM_NUMERO DECIMAL(18,0),
		COMPRA_NUMERO DECIMAL(18,0),
		PRECIO DECIMAL(18,2) NOT NULL,
		CANTIDAD DECIMAL(18,0) NOT NULL,
		ACCESORIO_PC DECIMAL(18,0),
		PRIMARY KEY(ITEM_NUMERO,COMPRA_NUMERO)
	);
	PRINT 'Tabla ITEM_COMPRA_PC creada';
END



--ACCESORIO
IF OBJECT_ID ('GESTION_DE_GATOS.ACCESORIO', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.ACCESORIO; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.ACCESORIO (
		ACCESORIO_CODIGO DECIMAL(18,0),
		AC_DESCRIPCION NVARCHAR(255) NOT NULL,
		FABRICANTE_ID DECIMAL(18,0),
		PRIMARY KEY(ACCESORIO_CODIGO)
	);
	PRINT 'Tabla ACCESORIO creada';
END


--PC
IF OBJECT_ID ('GESTION_DE_GATOS.PC', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.PC; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.PC (
		PC_CODIGO DECIMAL(18,0),
		GABINETE_CODIGO DECIMAL(18,0) NOT NULL,
		MOTHERBOARD NVARCHAR(255) NOT NULL,
		PRECIO DECIMAL(18,2) NOT NULL,
		PRIMARY KEY(PC_CODIGO)
	);
	PRINT 'Tabla PC creada';
END

--GABINETE
IF OBJECT_ID ('GESTION_DE_GATOS.GABINETE', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.GABINETE; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.GABINETE (
		GABINETE_CODIGO NVARCHAR(255), -- O DECIMAL?
		GABINETE_MODELO NVARCHAR(255) NOT NULL,
		GABINETE_ALTURA DECIMAL(18,2),
		GABINETE_ANCHO DECIMAL(18,2),
		GABINETE_PROFUNDIDAD DECIMAL(18,2),
		FABRICANTE_CODIGO DECIMAL(18,0),
		PRIMARY KEY(GABINETE_CODIGO)
	);
	PRINT 'Tabla GABINETE creada';
END


--COMPONENTE_X_PC
IF OBJECT_ID ('GESTION_DE_GATOS.COMPONENTE_X_PC', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.COMPONENTE_X_PC; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.COMPONENTE_X_PC (
		PC_CODIGO DECIMAL(18,0),
		COMPONENTE_CODIGO DECIMAL(18,0),
		PRIMARY KEY(PC_CODIGO,COMPONENTE_CODIGO)
	);
	PRINT 'Tabla COMPONENTE_X_PC creada';
END



--COMPONENTE
IF OBJECT_ID ('GESTION_DE_GATOS.COMPONENTE', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.COMPONENTE; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.COMPONENTE_X_PC (
		COMPONENTE_CODIGO NVARCHAR(255),
		VELOCIDAD NVARCHAR(255) NOT NULL,
		FABRICANTE_ID DECIMAL(18,0),
		PRIMARY KEY(COMPONENTE_CODIGO)
	);
	PRINT 'Tabla COMPONENTE creada';
END

--MEMORIA_RAM
IF OBJECT_ID ('GESTION_DE_GATOS.MEMORIA_RAM', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.MEMORIA_RAM; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.MEMORIA_RAM (
		COMPONENTE_CODIGO NVARCHAR(255),
		MEMORIA_RAM_TIPO NVARCHAR(255) NOT NULL,
		MEMORIA_RAM_CAPACIDAD NVARCHAR(255) NOT NULL,
		PRIMARY KEY(COMPONENTE_CODIGO)
	);
	PRINT 'Tabla MEMORIA_RAM creada';
END

--DISCO_RIGIDO
IF OBJECT_ID ('GESTION_DE_GATOS.DISCO_RIGIDO', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.DISCO_RIGIDO; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.DISCO_RIGIDO (
		COMPONENTE_CODIGO NVARCHAR(255),
		MEMORIA_RAM_TIPO NVARCHAR(255) NOT NULL,
		MEMORIA_RAM_CAPACIDAD NVARCHAR(255) NOT NULL,
		PRIMARY KEY(COMPONENTE_CODIGO)
	);
	PRINT 'Tabla DISCO_RIGIDO creada';
END

--PLACA_VIDEO
IF OBJECT_ID ('GESTION_DE_GATOS.PLACA_VIDEO', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.PLACA_VIDEO; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.PLACA_VIDEO (
		COMPONENTE_CODIGO NVARCHAR(255),
		PLACA_VIDEO_CHIPSET NVARCHAR(255) NOT NULL,
		PLACA_VIDEO_MODELO NVARCHAR(255) NOT NULL,
		PLACA_VIDEO_CAPACIDAD NVARCHAR(255) NOT NULL,
		PRIMARY KEY(COMPONENTE_CODIGO)
	);
	PRINT 'Tabla PLACA_VIDEO creada';
END


--MICROPROCESADOR
IF OBJECT_ID ('GESTION_DE_GATOS.MICROPROCESADOR', 'U') IS NOT NULL  
   DROP TABLE GESTION_DE_GATOS.MICROPROCESADOR; 
GO
BEGIN
	CREATE TABLE GESTION_DE_GATOS.MICROPROCESADOR (
		COMPONENTE_CODIGO NVARCHAR(255),
		MICROPROCESADOR_CACHE NVARCHAR(255) NOT NULL,
		MICROPROCESADOR_CANT_HILOS DECIMAL(18,0),
		PRIMARY KEY(COMPONENTE_CODIGO)
	);
	PRINT 'Tabla MICROPROCESADOR creada';
END


/*
		---------------------- MIGRACIONES ----------------------
*/


--MIGRACION SUCURSAL
IF OBJECT_ID ('GESTION_DE_GATOS.migracionSucursal', 'P') IS NOT NULL  
   DROP PROCEDURE GESTION_DE_GATOS.migracionSucursal; 
GO
CREATE PROCEDURE GESTION_DE_GATOS.migracionSucursal AS
BEGIN
	INSERT INTO GESTION_DE_GATOS.SUCURSAL
		SELECT DISTINCT SUCURSAL_MAIL, SUCURSAL_DIR, CIUDAD, SUCURSAL_TEL 
		FROM gd_esquema.Maestra
		WHERE SUCURSAL_MAIL IS NOT NULL
		ORDER BY SUCURSAL_MAIL
END;
GO

--MIGRACION CLIENTE
IF OBJECT_ID ('GESTION_DE_GATOS.migracionCliente', 'P') IS NOT NULL  
   DROP PROCEDURE GESTION_DE_GATOS.migracionCliente;
GO
CREATE PROCEDURE GESTION_DE_GATOS.migracionCliente AS
BEGIN
	INSERT INTO GESTION_DE_GATOS.CLIENTE(CLIENTE_DNI,CLIENTE_MAIL,CLIENTE_APELLIDO,CLIENTE_NOMBRE,CLIENTE_FECHA_NACIMIENTO,CLIENTE_TELEFONO,CLIENTE_DIRECCION)
		SELECT DISTINCT CLIENTE_DNI
			CLIENTE_DNI,
			CLIENTE_MAIL, 
			CLIENTE_APELLIDO,
			CLIENTE_NOMBRE,
			CLIENTE_FECHA_NACIMIENTO, 
			CLIENTE_TELEFONO, 
			CLIENTE_DIRECCION
		FROM gd_esquema.Maestra 
		WHERE CLIENTE_DNI IS NOT NULL
END;
GO


--MIGRAR TODA LA BASE DE DATOS
IF OBJECT_ID ('GESTION_DE_GATOS.migrarBaseDeDatos', 'P') IS NOT NULL  
   DROP PROCEDURE GESTION_DE_GATOS.migrarBaseDeDatos; 
GO
CREATE PROCEDURE GESTION_DE_GATOS.migrarBaseDeDatos AS
BEGIN
	EXEC GESTION_DE_GATOS.migracionSucursal
	EXEC GESTION_DE_GATOS.migracionCliente
END;
GO

EXEC GESTION_DE_GATOS.migrarBaseDeDatos


/*
		---------------------- DECLARACIONES DE FKs ----------------------
*/

--FACTURA
ALTER TABLE GESTION_DE_GATOS.FACTURA
ADD CONSTRAINT FK_FACTURA
FOREIGN KEY (CLIENTE_MAIL) REFERENCES GESTION_DE_GATOS.CLIENTE(CLIENTE_MAIL),
FOREIGN KEY (CLIENTE_DNI) REFERENCES GESTION_DE_GATOS.CLIENTE(CLIENTE_DNI),
FOREIGN KEY (SUCURSAL_MAIL) REFERENCES GESTION_DE_GATOS.SUCURSAL(SUCURSAL_MAIL)

--ITEM_FACTURA_ACCESORIO
ALTER TABLE GESTION_DE_GATOS.ITEM_FACTURA_ACCESORIO
ADD CONSTRAINT FK_ITEM_FACTURA_ACCESORIO
FOREIGN KEY (FACTURA_NUMERO) REFERENCES GESTION_DE_GATOS.FACTURA(FACTURA_NUMERO),
FOREIGN KEY (ACCESORIO_CODIGO) REFERENCES GESTION_DE_GATOS.ACCESORIO(ACCESORIO_CODIGO)


--ITEM_FACTURA_PC
ALTER TABLE GESTION_DE_GATOS.ITEM_FACTURA_PC
ADD CONSTRAINT ITEM_FACTURA_PC
FOREIGN KEY (FACTURA_NUMERO) REFERENCES GESTION_DE_GATOS.FACTURA(FACTURA_NUMERO),
FOREIGN KEY (PC_CODIGO) REFERENCES GESTION_DE_GATOS.PC(PC_CODIGO)

--COMPRA
ALTER TABLE GESTION_DE_GATOS.COMPRA
ADD CONSTRAINT COMPRA
FOREIGN KEY (SUCURSAL_MAIL) REFERENCES GESTION_DE_GATOS.SUCURSAL(SUCURSAL_MAIL)

--ITEM_COMPRA_ACCESORIO
ALTER TABLE GESTION_DE_GATOS.ITEM_COMPRA_ACCESORIO
ADD CONSTRAINT ITEM_COMPRA_ACCESORIO
FOREIGN KEY (COMPRA_NUMERO) REFERENCES GESTION_DE_GATOS.COMPRA(COMPRA_NUMERO),
FOREIGN KEY (ACCESORIO_CODIGO) REFERENCES GESTION_DE_GATOS.ACCESORIO(ACCESORIO_CODIGO)

--ITEM_COMPRA_ACCESORIO
ALTER TABLE GESTION_DE_GATOS.ITEM_COMPRA_ACCESORIO
ADD CONSTRAINT ITEM_COMPRA_ACCESORIO
FOREIGN KEY (COMPRA_NUMERO) REFERENCES GESTION_DE_GATOS.COMPRA(COMPRA_NUMERO),
FOREIGN KEY (PC_CODIGO) REFERENCES GESTION_DE_GATOS.PC(PC_CODIGO)


--ACCESORIO
ALTER TABLE GESTION_DE_GATOS.ACCESORIO
ADD CONSTRAINT ACCESORIO
FOREIGN KEY (FABRICANTE_CODIGO) REFERENCES GESTION_DE_GATOS.FABRICANTE(FABRICANTE_CODIGO)


--PC
ALTER TABLE GESTION_DE_GATOS.PC
ADD CONSTRAINT PC
FOREIGN KEY (GABINETE_CODIGO) REFERENCES GESTION_DE_GATOS.GABINETE(GABINETE_CODIGO)


--GABINETE
ALTER TABLE GESTION_DE_GATOS.GABINETE
ADD CONSTRAINT GABINETE
FOREIGN KEY (FABRICANTE_CODIGO) REFERENCES GESTION_DE_GATOS.FABRICANTE(FABRICANTE_CODIGO)

--COMPONENTE_X_PC
ALTER TABLE GESTION_DE_GATOS.COMPONENTE_X_PC
ADD CONSTRAINT COMPONENTE_X_PC
FOREIGN KEY (PC_CODIGO) REFERENCES GESTION_DE_GATOS.PC(PC_CODIGO).
FOREIGN KEY (COMPONENTE_CODIGO) REFERENCES GESTION_DE_GATOS.COMPONENTE(COMPONENTE_CODIGO)

--COMPONENTE
ALTER TABLE GESTION_DE_GATOS.COMPONENTE
ADD CONSTRAINT COMPONENTE
FOREIGN KEY (FABRICANTE_CODIGO) REFERENCES GESTION_DE_GATOS.FABRICANTE(FABRICANTE_CODIGO)


--MEMORIA_RAM
ALTER TABLE GESTION_DE_GATOS.MEMORIA_RAM
ADD CONSTRAINT MEMORIA_RAM
FOREIGN KEY (COMPONENTE_CODIGO) REFERENCES GESTION_DE_GATOS.COMPONENTE(COMPONENTE_CODIGO)


--DISCO_RIGIDO
ALTER TABLE GESTION_DE_GATOS.DISCO_RIGIDO
ADD CONSTRAINT DISCO_RIGIDO
FOREIGN KEY (COMPONENTE_CODIGO) REFERENCES GESTION_DE_GATOS.COMPONENTE(COMPONENTE_CODIGO)


--PLACA_VIDEO
ALTER TABLE GESTION_DE_GATOS.PLACA_VIDEO
ADD CONSTRAINT PLACA_VIDEO
FOREIGN KEY (COMPONENTE_CODIGO) REFERENCES GESTION_DE_GATOS.COMPONENTE(COMPONENTE_CODIGO)

--MICROPROCESADOR
ALTER TABLE GESTION_DE_GATOS.MICROPROCESADOR
ADD CONSTRAINT MICROPROCESADOR
FOREIGN KEY (COMPONENTE_CODIGO) REFERENCES GESTION_DE_GATOS.COMPONENTE(COMPONENTE_CODIGO)













SELECT * FROM GESTION_DE_GATOS.CLIENTE
SELECT * FROM GESTION_DE_GATOS.SUCURSAL

SELECT COUNT(DISTINCT SUCURSAL_MAIL) FROM gd_esquema.Maestra

SELECT COUNT(DISTINCT CLIENTE_DNI) FROM gd_esquema.Maestra
SELECT COUNT(DISTINCT CLIENTE_MAIL) FROM gd_esquema.Maestra

SELECT COUNT(*) FROM gd_esquema.Maestra WHERE CLIENTE_DNI IS NOT NULL GROUP BY CLIENTE_DNI



SELECT CLIENTE_DNI, CLIENTE_MAIL, COUNT(*) FROM gd_esquema.Maestra WHERE CLIENTE_DNI IS NOT NULL GROUP BY CLIENTE_DNI, CLIENTE_MAIL

SELECT * FROM gd_esquema.Maestra WHERE CLIENTE_DNI = '94306197'

SELECT * FROM gd_esquema.Maestra where CLIENTE_DNI = '25160712'


SELECT
	CLIENTE_DNI,
	COUNT(DISTINCT CLIENTE_MAIL)
FROM gd_esquema.Maestra 
GROUP BY CLIENTE_DNI
HAVING COUNT(DISTINCT CLIENTE_MAIL) > 1


SELECT
	CLIENTE_DNI,
	CLIENTE_MAIL,
	COUNT(DISTINCT CLIENTE_MAIL)
FROM gd_esquema.Maestra 
GROUP BY CLIENTE_DNI, CLIENTE_MAIL
HAVING COUNT(DISTINCT CLIENTE_MAIL) > 1

SELECT
	CLIENTE_DNI,
	CLIENTE_APELLIDO,
	COUNT(DISTINCT CLIENTE_MAIL)
FROM gd_esquema.Maestra 
GROUP BY CLIENTE_DNI, CLIENTE_MAIL
HAVING COUNT(DISTINCT CLIENTE_MAIL) > 1

select distinct CLIENTE_TELEFONO cliente_telenofo from gd_esquema.Maestra

select distinct CLIENTE_DNI cliente_DNI from gd_esquema.Maestra

SELECT * FROM gd_esquema.Maestra WHERE CLIENTE_DNI IN ('82765842','79932351','61426621','32042081','25160712')
SELECT 
	* 
FROM gd_esquema.Maestra 
WHERE FACTURA_NUMERO IS NOT NULL

SELECT * FROM GESTION_DE_GATOS.CLIENTE
