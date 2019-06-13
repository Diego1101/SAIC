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
CREATE TABLE CONTRATO
(
	CN_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	CN_ID_CLI		INT NOT NULL,
	CN_FOLIO		NVARCHAR(100),
	CN_CONTRATO		NVARCHAR(300),
	CN_PRECIO		FLOAT NOT NULL, --MENSUALIDAD O TOTAL
	CN_FECHA		DATETIME NOT NULL,
	CN_TIPO			INT NOT NULL, --1:VENTA, 2:RENTA --vn_id_tipo
	CN_ESTATUS		INT NOT NULL, --0: CANCELADA, 1:ACTIVA (RENTA), 2:TERMINADA(VENTA O RENTA)
	CN_FECHACORTE	DATE
)
GO


CREATE TABLE TIPO_VENTA
(
	TV_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	TV_TIPO		NVARCHAR(50) NOT NULL,
	TV_DESC		NVARCHAR(50)
)
GO
	
CREATE TABLE RENTA
(
	RN_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	RN_ID_MQ		INT NOT NULL,
	RN_ID_CONTRATO	INT NOT NULL,
	RN_COSTO		FLOAT,
	RN_DIRECCION	NVARCHAR(200),
	RN_NUMCOPIAS	INT,
	RN_COSTOEXTRA	FLOAT,
	RN_FECHASERV	DATE,
	RN_FECHAVEN		DATE NULL
)
GO

CREATE TABLE SERVICIO
(
	SR_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	SR_FOLIO		INT NOT NULL, --ASIGNADO POR LAS SECRETARIAS
	SR_NUMSERV		INT NOT NULL, --NUMERO DE RASTREO PARA EL CLIENTE
	SR_ID_MQ		INT NOT NULL,
	SR_ID_EMP		INT NOT NULL,
	SR_TIPO			INT NOT NULL, --0: PREVENTIVO O 1:CORRECTIVO
	SR_STATUS		INT NOT NULL,--0:CANCELADO, 1: EN ESPERA 2:TEMINADO
	SR_ESTADO		NVARCHAR(300), --IMAGEN O PDF DEL ESTADO EN EL QUE SE ENCONTRO Y EN EL QUE SE DEJA
	SR_PROBLEMA		NVARCHAR(500), --PROBLEMA QUE EL CLEINTE REPORTA
	SR_SOLUCION		NVARCHAR(500) NULL, --SOLUCION DEL TECNICO
	SR_PRECIO		FLOAT NULL, --SI ES CERO ES RENTA, SI NO ES ACARGO Y HAY QUE REGISTRAR LA MAQUINA
	SR_CONTADOR		INT NOT NULL,
	SR_FECHA		DATETIME NOT NULL, --FECHA DE CREACION
	SR_FECHA_INCIO	DATETIME NULL,	--ENTRADA DEL TECNICO
	SR_FECHA_FIN	DATETIME		--SALIDA DEL TECNICO
)
GO



CREATE TABLE SOLICITUD
(
	SL_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	SL_ID_SERV		INT NOT NULL,
	SL_FOLIO		INT NOT NULL,
	SL_NOMBRE		NVARCHAR(100) NOT NULL,
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
	PG_ESTATUS	INT NOT NULL, --0:SIN PAGAR, 1:PAGADO, 2:CANCELADO
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

INSERT INTO TIPO_VENTA(TV_TIPO) VALUES
	('VENTA'),
	('RENTA')
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
	
--INSERT INTO REFACCION(RF_MODELO, RF_PRECIO, RF_DESC) VALUES
	--('C-301', 234.50, 'TINTA NEGRA'),
	--('DV219', 408.30, 'RODILLO'),
	--('T21P', 2652.50, 'MOTOR'),
	--('RC267', 546, 'RUEDA'),
	--('CARTUCHO RX345', 120, 'TINTA MAGENTA')
--GO

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

INSERT INTO EMPLEADO(EM_ID_ROL, EM_ID_SUC, EM_NOMBRE, EM_APELLIDO, EM_USU, EM_CONTRA, EM_FOTO, EM_SEXO, EM_CUMPLE, EM_DIRECCION,  EM_TEL, EM_CORREO,EM_SEGURO, EM_ESTATUS, EM_FECHA_REG) VALUES
	(3, 1, 'ALEJANDRO', 'PEREZ', 'ALE', 'ALE', '', 1, '1989-06-11', 'PACHUCA', '65429382', 'ALE@MAIL.COM', 'ERPILO8E7FRTGYO8PO', 1, GETDATE())
GO

INSERT INTO MAQUINA(MQ_ID_EMP, MQ_ID_INV, MQ_MODELO, MQ_NOSERIE, MQ_ESTATUS, MQ_PRECIO, MQ_DESCRIPCION, MQ_CONTADOR, MQ_FOTO) VALUES
	(3, 1, 'EPSON', 'I6171', 1, 4789.20, 'TANQUE DE TINTA DE COLOR',0,  'Xerox.jpg'),
	(3, 1, 'HP', '987FSKJDF', 1, 4333.0, 'IMPRESION LASER B/N',0, 'Xerox.jpg'),
	(3, 1, 'HP', '876IAHSFDKJAS', 3, 6898.8, 'IMPRESION LASER',0, 'Xerox.jpg'),
	(3, 1, 'BROTHER', 'MFCL8999CDW', 2, 12296.28, 'ADVANCED DUPLEX AND WIRELESS',0, 'Xerox.jpg'),
	(3, 1, 'XEROX', 'WC3025', 2, 3549.0, 'HASTA 21 PPM',0, 'Xerox.jpg'),
	(3, 1, 'SAMSUNG', 'M4580FX', 2, 13358.0, 'DOBLE ESCANER',0, 'Xerox.jpg'),
	(3, 1, 'KYOCERA', 'M2135dn', 3, 7990.0, 'HASTA 35 PPM',0, 'Xerox.jpg'),
	(3, 1, 'BROTHER', 'I2540DW', 3, 2506.9, 'ALIMENTADOR AUTOMATICO',0, 'Xerox.jpg')
GO
	
INSERT INTO CONTRATO(CN_ID_CLI, CN_CONTRATO, CN_TIPO, CN_PRECIO, CN_FECHA, CN_FECHACORTE, CN_ESTATUS) VALUES
	(1,'CONTRATO', 2, 300.0, GETDATE(), GETDATE(), 1),
	(1,'CONTRATO', 2, 22763.7, GETDATE(), null, 2),
	(2,'CONTRATO', 2, 456.0, GETDATE(), GETDATE(), 2),
	(2,'CONTRATO', 2, 466.0, GETDATE(), GETDATE(), 1)
GO
	
INSERT INTO RENTA(RN_ID_MQ, RN_ID_CONTRATO, RN_FECHASERV, RN_DIRECCION, RN_COSTO, RN_NUMCOPIAS, RN_COSTOEXTRA) VALUES
	(6, 1, '2019-04-15', 'AV.IND 12 IZCALLI MEXICO 23421', .7, 500, 0.9),
	(7, 2, NULL, '', .7, 500, 0.9),
	(3, 2, NULL, '', .7, 500, 0.9),
	(8, 2, NULL, '', .7, 500, 0.9),
	(4, 3, '2019-04-16', 'CALLE 2 12 COACALCO MEXICO 82736', .7, 500, 0.9), --TERMINADA
	(5, 4, '2019-04-17', 'CALLE 3 13 TLANEPANTLA MEXICO 23849', .7, 500, 0.9), --ACTIVAS
	(4, 4, '2019-04-18', 'CALLE 4 14 CUAUTITLAN MEXICO 29484', .7, 500, 0.9)


INSERT INTO SERVICIO(SR_FOLIO, SR_NUMSERV, SR_ID_MQ, SR_ID_EMP, SR_TIPO, SR_STATUS, SR_ESTADO, SR_PROBLEMA, SR_CONTADOR, SR_FECHA, SR_FECHA_INCIO, SR_FECHA_FIN) VALUES
	(7654,345,5,3, 1, 1, 'LIGA-ESTADO', 'SOLICIONADOS PROBLEMAS RAROS', 0,GETDATE(),GETDATE(), NULL),
	(6534,345,4,3, 0, 2, 'LIGA-ESTADO', 'LIMPIEZA GENERAL',0, '2019-03-15','2019-03-15', '2019-03-16'),
	(7643,234,6,3, 0, 1, 'LIGA-ESTADO', 'PROBLEMA CON LA TINTA',0, '2019-04-15', '2019-04-15', NULL)
GO
--INSERTAR EJEMPLO
INSERT INTO SERVICIO(SR_FOLIO, SR_NUMSERV, SR_ID_MQ, SR_ID_EMP, SR_TIPO, SR_STATUS, SR_ESTADO, SR_PROBLEMA, SR_CONTADOR, SR_FECHA, SR_FECHA_INCIO, SR_FECHA_FIN) VALUES
	 (7653,345,6,3, 1, 1, 'LIGA-ESTADO', 'PROBLEMA CON CARTUCHOS',0, '2019-06-05', NULL, NULL)
GO


INSERT INTO SOLICITUD(SL_ID_SERV, SL_FOLIO, SL_NOMBRE, SL_ESTATUS, SL_DESCRIPCION) VALUES
	(1, 3,'PIEZA 1',  1, 'MOTOR PARA SUSTITUCION'),
	(3, 1,'PIEZA 2', 2, 'CAMBIO DE TONER'),
	(2, 1,'PIEZA 3', 0, 'CAMBIO DE TONER')
GO	




INSERT INTO PAGO(PG_ID_VENTA, PG_SUBTOTAL, PG_IVA, PG_ESTATUS, PG_TOTAL) VALUES
	(1, 600.00 , 96,0, 696),
	(2, 22763.7, 3642.19,0, 26405.89),
	(3, 456.00 , 66.56, 1, 528.96),
	(4, 466.00 , 66.56,1, 528.96)
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

CREATE PROCEDURE TSP_mostrarServiciosTec
(
	@TECNICO	INT,
	@TIPO		INT
)
AS
BEGIN

	IF(@TIPO=3)
	BEGIN
				
		SELECT SR_ID ID, SR_ID_MQ MAQUINA, SR_TIPO TIPO, SR_PROBLEMA, SR_FECHA FECHA, MQ_MODELO MODELO, RN_DIRECCION, CONCAT(CL_NOMBRE,' ' , CL_APELLIDO) NOMBRE, SR_FOLIO FOLIO
		FROM SERVICIO A, MAQUINA B, RENTA C, CONTRATO D, CLIENTE E
		WHERE SR_STATUS=1 AND SR_ID_EMP = @TECNICO AND MQ_ID=SR_ID_MQ AND RN_ID_MQ=MQ_ID AND RN_ID_CONTRATO=CN_ID AND CN_ESTATUS=1 AND CN_ID_CLI=CL_ID
		ORDER BY SR_TIPO DESC,SR_FECHA_INCIO ASC
					
	END
	ELSE
	BEGIN
		
		SELECT SR_ID ID, SR_ID_MQ MAQUINA, SR_TIPO TIPO, SR_PROBLEMA, SR_FECHA FECHA, MQ_MODELO MODELO, RN_DIRECCION, CONCAT(CL_NOMBRE,' ' , CL_APELLIDO) NOMBRE, SR_FOLIO FOLIO
		FROM SERVICIO A, MAQUINA B, RENTA C, CONTRATO D, CLIENTE E
		WHERE SR_STATUS=1 AND SR_TIPO=@TIPO AND SR_ID_EMP = @TECNICO AND MQ_ID=SR_ID_MQ AND RN_ID_MQ=MQ_ID AND RN_ID_CONTRATO=CN_ID AND CN_ESTATUS=1 AND CN_ID_CLI=CL_ID
		ORDER BY SR_TIPO DESC,SR_FECHA_INCIO ASC				
	END
END
GO


CREATE PROCEDURE TSP_ListarTecnico
AS
BEGIN
	SELECT CONVERT (VARCHAR(5),EM_ID) ID, CONCAT(EM_NOMBRE,' ' ,EM_APELLIDO) NOMBRE 
	FROM EMPLEADO 
	WHERE EM_ID_ROL =3 AND EM_ESTATUS=1
	ORDER BY EM_ID
END
GO


CREATE procedure TSP_asignaServ
(
	@TECNICO	INT,
	@SERVICIO	INT
)
AS
BEGIN
	UPDATE SERVICIO
	SET SR_ID_EMP= @TECNICO
	WHERE SR_ID= @SERVICIO
	SELECT 1
END
GO



--Mostar servicio (WHERE: EN ESPERA SR_STATUS=1, EN RENTA SR_PRECIO=0)
--
CREATE PROCEDURE TSP_ListarServicio
AS
BEGIN
	SELECT CONVERT (VARCHAR(5),SR_ID) ID, SR_PROBLEMA PROBLEMA, CONCAT (' EN LA MÁQUINA ', SR_ID_MQ) MAQUINA 
	FROM SERVICIO 
	WHERE SR_STATUS=1 
	ORDER BY SR_ID
END
GO

CREATE PROCEDURE TSP_ListarCliente
AS
BEGIN
	SELECT CONVERT (VARCHAR(5),CL_ID) ID, CONCAT(CL_NOMBRE, ' ', CL_APELLIDO) NOMBRE
	FROM CLIENTE
	WHERE CL_ESTATUS=1 
	ORDER BY CL_ID
END
GO


CREATE PROCEDURE TSP_TipoVenta
AS
BEGIN
	SELECT TV_ID ID, TV_TIPO TIPO
	FROM TIPO_VENTA 
	ORDER BY TV_ID
END
GO


CREATE PROCEDURE TSP_TipoEmpleado
AS
BEGIN
	SELECT TE_ID ID, TE_NOMBRE NOMBRE
	FROM TIPO_EMP
	ORDER BY TE_ID
END
GO


ALTER PROCEDURE TSP_ListarMaquina
AS
BEGIN
	SELECT MQ_ID ID, MQ_NOSERIE MAQUINA
	FROM MAQUINA 
	where MQ_ESTATUS = 1
	ORDER BY MQ_ID
END
GO

CREATE PROCEDURE TSP_ListarContrato
AS
BEGIN
	SELECT CN_ID ID, CN_FOLIO CONTRATO
	FROM CONTRATO
	ORDER BY CN_ID
END
GO

 --insertar contrato
CREATE PROCEDURE TSP_InsertarContrato
(
	@TIPO INT,
	@CLIENTE INT,
	@FOLIO NVARCHAR(100),
	@COSTO FLOAT,
	@FECHCORTE date, 
	@CONTRATO NVARCHAR(1000)
)
AS
BEGIN
IF NOT EXISTS(SELECT*FROM CONTRATO WHERE CN_FOLIO=@FOLIO)
BEGIN
 INSERT INTO CONTRATO VALUES(@CLIENTE,@FOLIO,@CONTRATO,@COSTO,GETDATE(),@TIPO,'1',@FECHCORTE)
 SELECT CN_ID FROM CONTRATO WHERE CN_FOLIO=@FOLIO
 END
 ELSE
 SELECT '-1' 
 END
 GO


 --insertar renta
ALTER PROCEDURE TSP_InsertarRenta
(
	@MAQUINA INT,
	@CONTRATO INT,
	@COSTO FLOAT,
	@COSTOEXTRA FLOAT,
	@DIRECCION NVARCHAR(100),
	@FECHAVEN	DATE,
	@NOCOPIA INT
)
--RN_FECHAVEN 
AS
BEGIN
IF NOT EXISTS(SELECT*FROM RENTA WHERE RN_ID_MQ=@MAQUINA)
BEGIN
 INSERT INTO RENTA VALUES(@MAQUINA,@CONTRATO,@COSTO,@DIRECCION,@NOCOPIA,@COSTOEXTRA,GETDATE(),@FECHAVEN)
UPDATE MAQUINA
SET MQ_ESTATUS= 2
WHERE MQ_ID= @MAQUINA
SELECT '1'
 END
 ELSE
 SELECT '-1' 
 END
 GO

 --SOLICITUDES
alter PROCEDURE TSP_ListarSolicitudes
AS
BEGIN
	SELECT A.SL_ID,A.SL_FOLIO,A.SL_NOMBRE,A.SL_DESCRIPCION
	FROM SOLICITUD A
	WHERE SL_ESTATUS = 1
	ORDER BY SL_ID
END
GO

 --SOLICITUDES
CREATE PROCEDURE TSP_ListarEmpleado
AS
BEGIN
	SELECT CN_ID ID, CN_FOLIO CONTRATO
	FROM EMPLEADO
	ORDER BY CN_ID
END
GO

CREATE PROCEDURE TSP_DATOSOLICITUD
(
	@ID		INT
)
AS
BEGIN

	IF EXISTS(SELECT SL_ID FROM SOLICITUD WHERE @ID=SL_ID)
	BEGIN
		SELECT A.SL_ID,A.SL_FOLIO,A.SL_NOMBRE,A.SL_DESCRIPCION
		FROM SOLICITUD A
		WHERE SL_ESTATUS = 1
		AND @ID = SL_ID
		ORDER BY SL_ID
	END

END
GO


 --procediemiento aprueba solicitudes de refaccion


CREATE PROCEDURE TSP_AproSolRefac
(
	@SOLICITUD INT,
	@DESCRIP NVARCHAR(500)
)
AS
BEGIN
	
	UPDATE SOLICITUD
	SET SL_ESTATUS= 2, SL_DESCRIPCION = @DESCRIP
	WHERE @SOLICITUD =SL_ID
	SELECT '1'
	
 END
 GO


CREATE PROCEDURE TSP_CancelarSolRefac
(
	@SOLICITUD INT
)
AS
BEGIN
	
	UPDATE SOLICITUD
	SET SL_ESTATUS= 0
	WHERE @SOLICITUD =SL_ID
	SELECT '1'
	
 END
 GO

 --INSERTAR USUARIO
CREATE PROCEDURE TSP_InsertarUsu
(
 @NOMBRE VARCHAR(20),
 @APELLIDO VARCHAR(20),
 @USU VARCHAR(15),
 @CONTRA VARCHAR(215),
 @FOTO VARCHAR(300),
 @CUMPLE DATE,
 @SEXO INT,
 @CALLE VARCHAR(20),
 @CIUDAD  VARCHAR(20),
 @ESTADO VARCHAR(20),
 @CP VARCHAR(10),
 @CORREO VARCHAR(150),
 @TELEFONO VARCHAR(12)
)
AS
BEGIN
IF NOT EXISTS(SELECT*FROM CLIENTE A WHERE @CORREO=A.CL_CORREO)
BEGIN
 INSERT INTO CLIENTE VALUES(@NOMBRE,@APELLIDO,@USU,@CONTRA,@FOTO,@CUMPLE,@SEXO,@CALLE,@CIUDAD,@ESTADO,@CP,@CORREO,@TELEFONO,1,GETDATE())
 SELECT '1'
 END
 ELSE
 SELECT '-1' 
 END
 GO






 CREATE  PROCEDURE TSP_EliminarUsuario
 (
  @ID INT
 )
AS
BEGIN
UPDATE CLIENTE 
SET CL_ESTATUS=0
WHERE CL_ID=@ID
SELECT '1'
END
GO

EXEC TSP_EliminarUsuario 2
GO
SELECT * FROM CLIENTE
GO


 CREATE PROCEDURE TSP_ConsultarUsu
 (
  @NOMBRE VARCHAR(20),
 @APELLIDO VARCHAR(20),
 @USU VARCHAR(15),
 @CONTRA VARCHAR(215),
 @FOTO VARCHAR(300),
 @CUMPLE DATE,
 @SEXO INT,
 @CALLE VARCHAR(20),
 @CIUDAD  VARCHAR(20),
 @ESTADO VARCHAR(20),
 @CP VARCHAR(10),
 @CORREO VARCHAR(150),
 @TELEFONO VARCHAR(12)
 )
AS
BEGIN
UPDATE CLIENTE
SET CL_NOMBRE=@NOMBRE,CL_APELLIDO=@APELLIDO,CL_USU=@USU,CL_CONTRA=@CONTRA,CL_FOTO=@FOTO,CL_CUMPLE=@CUMPLE,CL_SEXO=@SEXO,CL_CALLE=@CALLE,CL_CIUDAD=@CIUDAD,CL_ESTADO=@ESTADO,CL_CP=@CP,CL_CORREO=@CORREO,CL_TELEFONO=@TELEFONO
SELECT '1'
END
GO


CREATE  PROCEDURE TSP_ListarUsu
 (
  @ID INT
 )
AS
BEGIN
SELECT A.CL_NOMBRE,A.CL_APELLIDO,A.CL_USU,A.CL_CONTRA,A.CL_FOTO,A.CL_CUMPLE,A.CL_SEXO,A.CL_CALLE,A.CL_CIUDAD,A.CL_ESTADO,A.CL_CP,A.CL_CORREO,A.CL_TELEFONO FROM CLIENTE A
WHERE @ID=CL_ID
END
go
EXEC TSP_ListarUsu 1
GO

---INSERTAR EMPLEADO ---------

CREATE PROCEDURE TSP_InsertarEmp
(
 @ROL INT,
 @NOMBRE VARCHAR(20),
 @APELLIDO VARCHAR(20),
 @USU VARCHAR(15),
 @CONTRA VARCHAR(215),
 @FOTO VARCHAR(300),
 @SEXO INT,
 @CUMPLE DATE,
 @DIRECCION VARCHAR(20),
 @TELEFONO VARCHAR(12),
 @CORREO VARCHAR(150),
 @SEGURO VARCHAR (50)
 
)
AS
BEGIN
IF NOT EXISTS(SELECT*FROM EMPLEADO A WHERE @CORREO=A.EM_CORREO)
BEGIN
 INSERT INTO EMPLEADO VALUES(@ROL,@SUC, @NOMBRE,@APELLIDO,@USU,@CONTRA,@FOTO,@SEXO,@CUMPLE,@DIRECCION,@TELEFONO,@CORREO,@SEGURO,1,GETDATE())
 SELECT '1'
 END
 ELSE
 SELECT '-1' 
 END
 GO








EXEC TSP_ListarTecnico
EXEC TSP_ListarServicio
EXEC TSP_ListarMaquina
EXEC TSP_ListarContrato
EXEC TSP_ListarSolicitudes
EXEC TSP_asignaServ 3, 5
EXEC TSP_TipoVenta
EXEC TSP_DATOSOLICITUD 1
EXEC TSP_InsertarRenta 1,5, 5,4, 'Escobedo 120 Col. Centro',600

EXEC TSP_mostrarServiciosTec 3, 3
EXEC TSP_InsertarContrato 2,2,152019,5000, '2019/2/5','pendiente'
exec TSP_iniciarSesion 'inguz', 'inguz', 0
--SELECT * FROM EMPLEADO
SELECT * FROM CLIENTE
SELECT * FROM SERVICIO
SELECT * FROM MAQUINA
SELECT * FROM RENTA
SELECT * FROM CONTRATO
SELECT * FROM PAGO
SELECT * FROM TIPO_EMP
SELECT * FROM TIPO_VENTA
SELECT * FROM SOLICITUD
