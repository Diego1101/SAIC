CREATE TABLE SUCURSAL
(
	SC_ID 		INT PRIMARY KEY IDENTITY NOT NULL,
	SC_NOMBRE 	NVARCHAR(50) NOT NULL,
	SC_CALLE	NVARCHAR(100) NOT NULL,
	SC_CIUDAD	NVARCHAR(50) NOT NULL,
	SC_ESTADO	NVARCHAR(20) NOT NULL
	SC_CP		NVARCHAR(6) NOT NULL,
	SC_TEL		NVARCHAR(12) NOT NULL,
	SC_ESTATUS	INT NOT NULL
)GO

CREATE TABLE TIPO_EMP
(
	TE_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	TE_NOMBRE	NVARCHAR(50) NOT NULL,
	TE_DESC		NVARCHAR(50)
)GO

CREATE TABLE CLIENTE
(
	CL_ID 		INT PRIMARY KEY IDENTITY NOT NULL,
	CL_NOMBRE 	NVARCHAR(20) NOT NULL,
	CL_APELLIDO	NVARCHAR(20) NOT NULL,
	CL_USU		NVARCHAR(15) NOT NULL,
	CL_CONTRA 	NVARCHAR(15) NOT NULL,
	CL_FOTO		NVARCHAR(300) NOT NULL,
	CL_CUMPLE	DATETIME NOT NULL,
	CL_SEXO		INT,
	CL_CALLE	NVARCHAR(20),
	CL_CIUDAD	NVARCHAR(20),
	CL_ESTADO 	NVARCHAR(20), 
	CL_CP		NVARCHAR(10),
	CL_CORREO 	NVARCHAR(150) NOT NULL,
	CL_TELEFONO	NVARCHAR(12) NOT NULL,
	CL_ESTATUS	INT NOT NULL,
	CL_FECHA_REG DATETIME NOT NULL,
	
)
GO

CREATE TABLE REGCLIENTE(
	RC_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	RC_ID_CLI	INT NOT NULL,
	RC_ID_SUC	INT NOT NULL
)GO


CREATE TABLE INVREFACCIONES
(
	IR_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	IR_ID_INV	INT NOT NULL,
	IR_ID_RF	INT NOT NULL,
	IR_CANTIDAD	INT NOT NULL
)GO

CREATE TABLE INVENTARIO
(
	IN_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	IN_SUC		INT NOT NULL,
	IN_NOMBRE	NVARCHAR(50) NOT NULL,
	IN_TELEFONO NVARCHAR(12) NOT NULL,
	IN_DIR		NVARCHAR(200) NOT NULL,
	IN_ESTATUS	INT NOT NULL
)GO


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
   EM_SEXO		INT	NOT NULL,
   EM_CUMPLE	DATETIME NOT NULL,
   EM_DIRECCION NVARCHAR(250) NULL,
   EM_TEL		NVARCHAR(20) NULL,
   EM_CORREO	NVARCHAR(150) NOT NULL,
   EM_SEGURO	NVARCHAR(50) NOT NULL
   EM_ESTATUS	INT NOT NULL,
   EM_FECHA_REG DATETIME NOT NULL
)
GO

CREATE TABLE REFACCION
(
	RF_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	RF_MODELO	NVARCHAR(50) NOT NULL,
	RF_PRECIO	FLOAT NOT NULL,
	RF_DESC		NVARCHAR(200)
)GO

CREATE TABLE MAQUINA
(
	MQ_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	MQ_ID_EMPLEADO	INT, --EMPLEADO ENCARGADO DE LOS SERVICIOS DE LA MAQUINA, 0:NO RENTADA
	MQ_ID_INV		INT NOT NULL,
	MQ_MARCA		NVARCHAR(100) NOT NULL,
	MQ_MODELO		NVARCHAR(100) NOT NULL, 
	MQ_STATUS		INT NOT NULL, --1:EN ALMACEN, 2:RENTADA, 3:VENDIDA, 0:DADA DE BAJA
	MQ_PRECIO		FLOAT, 
	MQ_DESCRIPCION	NVARCHAR(500),
	
)GO

CREATE TABLE RENTA
(
	RN_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	RN_ID_MAQUINA	INT NOT NULL,
	RN_ID_VENTA		INT NOT NULL,
	RN_FECHASERV	DATETIME NOT NULL,
	RN_ESTATUS		INT --1: ACTIVA, 2:TERMINADA, 3:VENTA
)GO

CREATE TABLE VENTA
(
	VN_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	VN_ID_CLIENTE	INT NOT NULL,
	VN_CONTRATO		NVARCHAR(300),
	VN_TIPO			INT NOT NULL, --1:RENTA 3: VENTA
	VN_PRECIO		FLOAT NOT NULL, --MENSUALIDAD
	VN_FECHAPAGO	DATETIME,
)GO

CREATE TABLE SERVICIO
(
	SR_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	SR_ID_MAQUINA	INT NOT NULL,
	SR_ID_EMPLEADO	INT NOT NULL,
	SR_TIPO			INT NOT NULL, --PREVENTIVO O CORRECTIVO
	SR_STATUS		INT NOT NULL,--0:CANCELADO, 1: EN ESPERA 2:TEMINADO
	SR_ESTADO		NVARCHAR(300), --IMAGEN O PDF DEL ESTADO EN EL QUE SE ENCONTRO Y EN EL QUE SE DEJA
	SR_DESCRIPCION	NVARCHAR(500) NOT NULL
)GO


CREATE TABLE SOLICITUD
(
	SL_ID			INT PRIMARY KEY IDENTITY NOT NULL,
	SL_ID_SERVICIO	INT NOT NULL,
	SL_ID_REF		INT NOT NULL,
	SL_ESTATUS		INT NOT NULL, -- 0:NEGADA, 1:PENDIENTE, 2:APROBADA
	SL_DESCRIPCION NVARCHAR(200)
)GO

CREATE TABLE DETPAGO
(
	DP_ID 		INT PRIMARY KEY IDENTITY NOT NULL,
	DP_ID_PAGO	INT NOT NULL,
	DP_ID_VENTA	INT NOT NULL,
	DP_DESC		NVARCHAR(200) NOT NULL,
	DP_TOTAL	FLOAT NOT NULL
)GO

CREATE TABLE PAGO
(
	PG_ID		INT PRIMARY KEY IDENTITY NOT NULL,
	PG_ID_VENTA	INT NOT NULL,
	PG_SUBTOTAL	FLOAT NOT NULL,
	PG_IVA		FLOAT NOT NULL,
	PG_TOTAL	FLOAT NOT NULL
)GO