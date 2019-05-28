USE MASTER
GO

IF EXISTS (SELECT * FROM sysdatabases WHERE NAME ='BD_SGAIC')
BEGIN
	DROP DATABASE BD_SGAIC
END

CREATE DATABASE BD_SGAIC
GO
USE BD_SGAIC
GO

----------------------------------------------------------------------
--------------------------------TABLAS--------------------------------
----------------------------------------------------------------------
CREATE TABLE SUCURSAL
(
	SC_ID 		INT PRIMARY KEY IDENTITY NOT NULL,
	SC_NOMBRE 	NVARCHAR(50) NOT NULL,
	SC_CALLE	NVARCHAR(100) NOT NULL,
	SC_CIUDAD	NVARCHAR(50) NOT NULL,
	SC_ESTADO	NVARCHAR(20) NOT NULL,
	SC_CP		NVARCHAR(6) NOT NULL,
	SC_TEL		NVARCHAR(12) NOT NULL,
	SC_ESTATUS	INT NOT NULL
)
GO

CREATE TABLE TIPO_EMP
(
	TE_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	TE_NOMBRE	NVARCHAR(50) NOT NULL,
	TE_DESC		NVARCHAR(50)
)
GO


CREATE TABLE CLIENTE
(
	CL_ID 		INT PRIMARY KEY IDENTITY NOT NULL,
	CL_NOMBRE 	NVARCHAR(20) NOT NULL,
	CL_APELLIDO	NVARCHAR(20) NOT NULL,
	CL_USU		NVARCHAR(15) NOT NULL,
	CL_CONTRA 	NVARCHAR(15) NOT NULL,
	CL_FOTO		NVARCHAR(300) NOT NULL,
	CL_CUMPLE	DATE NOT NULL,
	CL_SEXO		INT, --0:Femenino, 1:Masculino, 2: Otro
	CL_CALLE	NVARCHAR(20),
	CL_CIUDAD	NVARCHAR(20),
	CL_ESTADO 	NVARCHAR(20), 
	CL_CP		NVARCHAR(10),
	CL_CORREO 	NVARCHAR(150) NOT NULL,
	CL_TELEFONO	NVARCHAR(12) NOT NULL,
	CL_ESTATUS	INT NOT NULL,
	CL_FECHA_REG DATETIME NOT NULL
)
GO

CREATE TABLE REGCLIENTE(
	RC_ID_CLI	INT NOT NULL,
	RC_ID_SUC	INT NOT NULL
)
GO


CREATE TABLE INVENTARIO
(
	IN_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	IN_SUC		INT NOT NULL,
	IN_NOMBRE	NVARCHAR(50) NOT NULL,
	IN_TELEFONO NVARCHAR(12) NOT NULL,
	IN_DIR		NVARCHAR(200) NOT NULL,
	IN_ESTATUS	INT NOT NULL
)
GO

CREATE TABLE REFACCION
(
	RF_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	RF_NUMPIEZA	NVARCHAR(50) NOT NULL,
	RF_NOMBRE	NVARCHAR(100) NOT NULL,
	RF_MAQUINAS	NVARCHAR(300) NOT NULL,
	RF_DESC		NVARCHAR(200) -- QUE ES?
)
GO

CREATE TABLE INVREFACCION
(
	IR_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	IR_ID_INV	INT NOT NULL,
	IR_ID_RF	INT NOT NULL,
	IR_CANTIDAD	INT NOT NULL
)
GO

CREATE TABLE EMPLEADO
(
   EM_ID		INT	PRIMARY KEY IDENTITY NOT NULL,
   EM_ID_ROL	INT NOT NULL,
   EM_ID_SUC	INT NOT NULL,
   EM_NOMBRE	NVARCHAR(20) NOT NULL,
   EM_APELLIDO	NVARCHAR(20) NOT NULL,
   EM_USU		NVARCHAR(15) NOT NULL,
   EM_CONTRA	NVARCHAR(15) NOT NULL,
   EM_FOTO		NVARCHAR(300) NOT NULL,
   EM_SEXO		INT	NOT NULL, --0:Femenino, 1:Masculino, 2: Otro
   EM_CUMPLE	DATE NOT NULL,
   EM_DIRECCION NVARCHAR(250) NULL,
   EM_TEL		NVARCHAR(20) NULL,
   EM_CORREO	NVARCHAR(150) NOT NULL,
   EM_SEGURO	NVARCHAR(50),
   EM_ESTATUS	INT NOT NULL,
   EM_FECHA_REG DATETIME NOT NULL
)
GO

CREATE TABLE MAQUINA
(
	MQ_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	MQ_ID_EMP		INT, --EMPLEADO ENCARGADO DE LOS SERVICIOS DE LA MAQUINA, 0:NO RENTADA
	MQ_ID_INV		INT NOT NULL,
	MQ_MODELO		NVARCHAR(100) NOT NULL, 
	MQ_NOSERIE		NVARCHAR(200) NOT NULL,
	MQ_ESTATUS		INT NOT NULL, --1:EN ALMACEN, 2:RENTADA, 3:VENDIDA, 0:DADA DE BAJA
	MQ_PRECIO		FLOAT, 
	MQ_DESCRIPCION	NVARCHAR(500),
	MQ_ULT_SERVICIO	DATE,
	MQ_CONTADOR 	INT NOT NULL,
	MQ_FOTO			NVARCHAR(300)
	
)
GO

--UNA VENTA SOLO PUEDE TENER PURAS VENTAS O PURAS RENTAS
CREATE TABLE VENTA
(
	VN_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	VN_ID_CLI		INT NOT NULL,
	VN_CONTRATO		NVARCHAR(300),
	VN_PRECIO		FLOAT NOT NULL, --MENSUALIDAD O TOTAL
	VN_FECHA		DATETIME NOT NULL,
	VN_TIPO			INT NOT NULL, --0:VENTA, 1:RENTA 
	VN_ESTATUS		INT NOT NULL, --0: CANCELADA, 1:ACTIVA (RENTA), 2:TERMINADA(VENTA O RENTA)
	VN_FECHACORTE	DATE
)
GO

	
CREATE TABLE RENTA
(
	RN_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	RN_ID_MQ		INT NOT NULL,
	RN_ID_VENTA		INT NOT NULL,
	RN_CALLE	NVARCHAR(20),
	RN_NUMERO	NVARCHAR(20),
	RN_CIUDAD	NVARCHAR(20),
	RN_ESTADO 	NVARCHAR(20), 
	RN_CP		NVARCHAR(10),
	RN_FECHASERV	DATE
)
GO

CREATE TABLE SERVICIO
(
	SR_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	SR_FOLIO		INT NOT NULL, --ASIGNADO POR LAS SECRETARIAS
	SR_NUMEROSERV	INT NOT NULL, --NUMERO DE RASTREO PARA EL CLIENTE
	SR_ID_MQ		INT NOT NULL,
	SR_ID_EMP		INT NOT NULL,
	SR_TIPO			INT NOT NULL, --0: PREVENTIVO O 1:CORRECTIVO
	SR_STATUS		INT NOT NULL,--0:CANCELADO, 1: EN ESPERA 2:TEMINADO
	SR_ESTADO		NVARCHAR(300), --IMAGEN O PDF DEL ESTADO EN EL QUE SE ENCONTRO Y EN EL QUE SE DEJA
	SR_PROBLEMA		NVARCHAR(500), --PROBLEMA QUE EL CLEINTE REPORTA
	SR_SOLUCION		NVARCHAR(500) NOT NULL, --SOLUCION DEL TECNICO
	SR_PRECIO		FLOAT NULL, --SI ES CERO ES RENTA, SI NO ES ACARGO Y HAY QUE REGISTRAR LA MAQUINA
	SR_CONTADOR		INT NOT NULL,
	SR_FECHA		DATETIME NOT NULL, --FECHA DE CREACION
	SR_FECHA_INCIO	DATETIME NOT NULL,	--ENTRADA DEL TECNICO
	SR_FECHA_FIN	DATETIME		--SALIDA DEL TECNICO
)
GO

CREATE TABLE SOLICITUD
(
	SL_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	SL_ID_SERV	INT NOT NULL,
	SL_ID_FOLIO		INT NOT NULL,
	SL_NOMBRE		INT NOT NULL,
	SL_ESTATUS		INT NOT NULL, -- 0:NEGADA, 1:PENDIENTE, 2:APROBADA, 3:TERMINADA(PIEZA COMPRADA), +10 oculta
	SL_DESCRIPCION NVARCHAR(200)
)
GO

CREATE TABLE PAGO
(
	PG_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	PG_ID_VENTA	INT NOT NULL,
	PG_SUBTOTAL	FLOAT NOT NULL,
	PG_IVA		FLOAT NOT NULL,
	PG_TOTAL	FLOAT NOT NULL
)
GO

CREATE TABLE DETPAGO
(
	DP_ID 		INT PRIMARY KEY IDENTITY NOT NULL,
	DP_ID_PAGO	INT NOT NULL,
	DP_DESC		NVARCHAR(200) NOT NULL,
	DP_TOTAL	FLOAT NOT NULL
)
GO

----------------------------------------------------------------------
---------------------------------DATOS--------------------------------
----------------------------------------------------------------------

INSERT INTO SUCURSAL VALUES ('SUCRSAL IZCALLI', 'BANCOS', 'CUATITLAN IZCALLI', 'ESTADO DE MEXICO', '56345', '5584726482', 1);
GO

INSERT INTO TIPO_EMP(TE_NOMBRE) VALUES
	('Administrador'),
	('Secretaria'), 
	('Tecnico')
GO
	
INSERT INTO CLIENTE VALUES
	('Agustin', 'Madrigales', 'agus', 'contraseña', '', '1967-06-25', 1, 'calle 12', 'CUAUTITLAN', 'MEXICO', '53426', '1@gamil.com', '558408563', 1, GETDATE())
GO
INSERT INTO CLIENTE VALUES
	('Maria', 'Ramires', 'inguz', 'inguz', '', '1987-02-13', 0, 'Ahuehuetes', 'Coacalco', 'MEXICO', '55417', '2@gamil.com', '5583746828', 1, GETDATE())
GO

INSERT INTO REGCLIENTE(RC_ID_CLI, RC_ID_SUC) VALUES
	(1, 1),
	(2,1)
GO	
	
INSERT INTO INVENTARIO(IN_SUC, IN_NOMBRE, IN_TELEFONO, IN_DIR, IN_ESTATUS) VALUES
	(1, 'ALMACEN INDEP', '5562749274', 'CALLE OLIVOS', 1),
	(1, 'ALMACEN DOS', '5598382736', 'CALLE DOS', 1)
GO
	
INSERT INTO REFACCION(RF_MODELO, RF_PRECIO, RF_DESC) VALUES
	('C-301', 234.50, 'TINTA NEGRA'),
	('DV219', 408.30, 'RODILLO'),
	('T21P', 2652.50, 'MOTOR'),
	('RC267', 546, 'RUEDA'),
	('CARTUCHO RX345', 120, 'TINTA MAGENTA')
GO

INSERT INTO INVREFACCION(IR_ID_INV, IR_ID_RF, IR_CANTIDAD) VALUES
	(1, 1, 10),
	(1, 2, 4),
	(1, 3, 2),
	(1, 4, 1),
	(1, 5, 30),
	(2, 4, 20)
GO

INSERT INTO EMPLEADO(EM_ID_ROL, EM_ID_SUC, EM_NOMBRE, EM_APELLIDO, EM_USU, EM_CONTRA, EM_FOTO, EM_SEXO, EM_CUMPLE, EM_DIRECCION,  EM_TEL, EM_CORREO,EM_SEGURO, EM_ESTATUS, EM_FECHA_REG) VALUES
	(1, 1, 'ADALEYSI', 'LARA', 'ADA', 'ADA', '', 0, '1974-12-12', 'ACTOPAN', '83749202', 'ADA@MAIL.COM', 'UEOSKD9284UDJSAJQ', 1, GETDATE()),
	(2, 1, 'LUIS', 'JIMENEZ', 'LUI', 'LUI', '', 1, '1964-05-28', 'OJO DE AGUA', '239483472', 'LUIS@MAIL.COM', 'JAMSF2948SJSAL', 1, GETDATE()),
	(3, 1, 'DIEGO', 'MENDOZA', 'DIG', 'DIG', '', 1, '1982-04-11', 'PACHUCA', '53729382', 'DIG@MAIL.COM', 'UDJSO8E7EUDJSO8YK', 1, GETDATE())
GO

INSERT INTO MAQUINA(MQ_ID_EMPLEADO, MQ_ID_INV, MQ_MARCA, MQ_MODELO, MQ_ESTATUS, MQ_PRECIO, MQ_DESCRIPCION, MQ_FOTO) VALUES
	(NULL, 1, 'EPSON', 'I6171', 1, 4789.20, 'TANQUE DE TINTA DE COLOR', ''),
	(NULL, 1, 'HP', 'LASERJET PRO M477NW', 1, 4333.0, 'IMPRESION LASER B/N', ''),
	(NULL, 1, 'HP', 'LASERJET PRO M521', 3, 6898.8, 'IMPRESION LASER', ''),
	(NULL, 1, 'BROTHER', 'MFCL8999CDW', 2, 12296.28, 'ADVANCED DUPLEX AND WIRELESS', ''),
	(NULL, 1, 'XEROX', 'WC3025', 2, 3549.0, 'HASTA 21 PPM', ''),
	(NULL, 1, 'SAMSUNG', 'M4580FX', 2, 13358.0, 'DOBLE ESCANER', ''),
	(NULL, 1, 'KYOCERA', 'M2135dn', 3, 7990.0, 'HASTA 35 PPM', ''),
	(NULL, 1, 'BROTHER', 'DCP I2540DW', 3, 2506.9, 'ALIMENTADOR AUTOMATICO', '')
GO
	
INSERT INTO VENTA(VN_ID_CLIENTE, VN_CONTRATO, VN_TIPO, VN_PRECIO, VN_FECHA, VN_FECHACORTE, VN_ESTATUS) VALUES
	(1,'CONTRATO', 1, 300.0, GETDATE(), GETDATE(), 1),
	(1,'CONTRATO', 2, 22763.7, GETDATE(), null, 2),
	(2,'CONTRATO', 1, 456.0, GETDATE(), GETDATE(), 2),
	(2,'CONTRATO', 1, 466.0, GETDATE(), GETDATE(), 1)
GO
	
	
INSERT INTO RENTA(RN_ID_MAQUINA, RN_ID_VENTA, RN_FECHASERV, RN_CALLE, RN_NUMERO, RN_CIUDAD, RN_ESTADO, RN_CP) VALUES
	(6, 1, '2019-04-15', 'AV.IND','12','IZCALLI','MEXICO','23421'),
	(7, 2, NULL, '','','','',''),
	(3, 2, NULL, '','','','',''),
	(8, 2, NULL, '','','','',''),
	(4, 3, '2019-04-16', 'CALLE 2','12','COACALCO','MEXICO','82736'), --TERMINADA
	(5, 4, '2019-04-17', 'CALLE 3','13','TLANEPANTLA','MEXICO','23849'), --ACTIVAS
	(4, 4, '2019-04-18', 'CALLE 4','14','CUAUTITLAN','MEXICO','29484')
GO


INSERT INTO SERVICIO(SR_ID_MAQUINA, SR_ID_EMPLEADO, SR_TIPO, SR_STATUS, SR_ESTADO, SR_DESCRIPCION, SR_FECHA_INCIO, SR_FECHA_FIN) VALUES
	(5,3, 1, 1, 'LIGA-ESTADO', 'SOLICIONADOS PROBLEMAS RAROS', GETDATE(), NULL),
	(4,3, 0, 2, 'LIGA-ESTADO', 'LIMPIEZA GENERAL', '2019-03-15', '2019-03-16'),
	(6,3, 0, 1, 'LIGA-ESTADO', 'PROBLEMA CON LA TINTA', '2019-04-15', NULL)
GO

INSERT INTO SOLICITUD(SL_ID_SERVICIO, SL_ID_REF, SL_ESTATUS, SL_DESCRIPCION) VALUES
	(1, 3, 1, 'MOTOR PARA SUSTITUCION'),
	(3, 1, 2, 'CAMBIO DE TONER'),
	(2, 1, 0, 'CAMBIO DE TONER')
GO	

INSERT INTO PAGO(PG_ID_VENTA, PG_SUBTOTAL, PG_IVA, PG_TOTAL) VALUES
	(1, 600.00 , 96, 696),
	(2, 22763.7, 3642.19, 26405.89),
	(3, 456.00 , 66.56, 528.96),
	(4, 466.00 , 66.56, 528.96)
GO

INSERT INTO DETPAGO(DP_ID_PAGO, DP_DESC, DP_TOTAL) VALUES
	(2,'CONCEPTO MAQUINA 7', 13358.0),
	(2, 'CONCEPTO MAQUINA 3', 6898.8),
	(2, 'CONCEPTO MAQUINA 8', 2506.9),
	(1, 'RENTA MARZO', 300.00),
	(1, 'RENTA ABRIL', 300.00),
	(3, 'ULTIMA RENTA', 456.00),
	(4, 'RENTA ABRIL', 466.00)	
GO



----------------------------------------------------------------------
----------------------PROCEDIMIETNOS ALMACENADOS----------------------
----------------------------------------------------------------------

CREATE PROCEDURE TSP_iniciarSesion
(
	@USU NVARCHAR(15),
	@CONTRA	 NVARCHAR(15),
	@TIPO INT
)
AS
BEGIN

	IF (@TIPO=1)
	BEGIN 
		IF EXISTS(SELECT * FROM EMPLEADO WHERE EM_USU=@USU AND EM_CONTRA=@CONTRA AND EM_ESTATUS=1)
		BEGIN
			SELECT  EM_ID CLAVE,EM_USU USUARIO, CONCAT(EM_NOMBRE,' ' ,EM_APELLIDO) NOMBRE, EM_ID_ROL ROL, EM_ID_SUC SUCURSAL 
			FROM EMPLEADO
			WHERE EM_USU=@USU AND EM_CONTRA=@CONTRA
		END
		ELSE SELECT -1	
	END

	ELSE IF(@TIPO=0)
	BEGIN
		IF EXISTS(SELECT * FROM CLIENTE WHERE CL_USU=@USU AND CL_CONTRA=@CONTRA AND CL_ESTATUS=1)
		BEGIN
			SELECT CL_ID CLAVE, CL_USU USUARIO, CONCAT(CL_NOMBRE, ' ', CL_APELLIDO) NOMBRE, 0 ROL
			FROM CLIENTE 
			WHERE CL_USU=@USU AND CL_CONTRA=@CONTRA AND CL_ESTATUS=1
		END
		ELSE SELECT -1
	END
END
GO

ALTER PROCEDURE TSP_mosntrarServiciosTec
(
	@TECNICO	INT,
	@TIPO		INT
)
AS
BEGIN

	IF(@TIPO=3)
	BEGIN
		SELECT SR_ID ID, SR_ID_MAQUINA MAQUINA, SR_TIPO TIPO, SR_DESCRIPCION, SR_FECHA_INCIO INICIO, MQ_MODELO MODELO, RN_CALLE CALLE, RN_NUMERO NUM, RN_CIUDAD CIUDAD, RN_ESTADO ESTADO, RN_CP CP, CONCAT(CL_NOMBRE,' ' , CL_APELLIDO) NOMBRE
		FROM SERVICIO A, MAQUINA B, RENTA C, VENTA D, CLIENTE E
		WHERE SR_STATUS=1 AND SR_ID_EMPLEADO = @TECNICO AND MQ_ID=SR_ID_MAQUINA AND RN_ID_MAQUINA=MQ_ID AND RN_ID_VENTA=VN_ID AND VN_ESTATUS=1 AND VN_ID_CLIENTE=CL_ID
		ORDER BY SR_TIPO DESC,SR_FECHA_INCIO ASC	
	END
	ELSE
	BEGIN
		SELECT SR_ID ID, SR_ID_MAQUINA MAQUINA, SR_TIPO TIPO, SR_DESCRIPCION, SR_FECHA_INCIO INCIO, MQ_MODELO MODEL, RN_CALLE CALLE, RN_NUMERO NUM, RN_CIUDAD CIUDAD, RN_ESTADO ESTADO, RN_CP CP, CONCAT(CL_NOMBRE,' ' , CL_APELLIDO) NOMBRE
		FROM SERVICIO A, MAQUINA B, RENTA C, VENTA D, CLIENTE E
		WHERE SR_STATUS=1 AND SR_TIPO=@TIPO AND SR_ID_EMPLEADO = @TECNICO AND MQ_ID=SR_ID_MAQUINA AND RN_ID_MAQUINA=MQ_ID AND RN_ID_VENTA=VN_ID AND VN_ESTATUS=1 AND VN_ID_CLIENTE=CL_ID
		ORDER BY SR_TIPO DESC,SR_FECHA_INCIO ASC		
	END
END
GO

EXEC TSP_mosntrarServiciosTec 3, 3

exec TSP_iniciarSesion 'inguz', 'inguz', 0

--SELECT * FROM EMPLEADO
SELECT * FROM CLIENTE
SELECT * FROM SERVICIO
SELECT * FROM MAQUINA
SELECT * FROM RENTA
SELECT * FROM VENTA