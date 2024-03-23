-- creacion de base de datos--

     DROP DATABASE IF EXISTS spa_los_robles ; 
	 CREATE DATABASE spa_los_robles ; 
     USE spa_los_robles ;

     
-- creacion de tablas--
    
     CREATE TABLE EMPLEADO(
		idempleado 			INT PRIMARY KEY AUTO_INCREMENT 
	 ,	nombre 				VARCHAR (100) NOT NULL
     ,	correo 				VARCHAR (100) UNIQUE NOT NULL
     ,	telefono 			VARCHAR (30) NOT NULL
     ,  direccion 			VARCHAR (100) NOT NULL 
     ,	cuil 				VARCHAR (11) NOT NULL
     ,  fechacontratacion 	DATETIME
     ,	idspa				INT
     ) 
     COMMENT "almacena informacion sobre los empleados"
     ;
     
     CREATE TABLE CLIENTE(
		idcliente 		INT PRIMARY KEY AUTO_INCREMENT 
	,	nombreyapellido VARCHAR (100) DEFAULT "a_confirmar"
    ,   dni 			VARCHAR (8) UNIQUE NOT NULL
	,	correo 			VARCHAR (100) UNIQUE NOT NULL 
	,	telefono 		VARCHAR (30) NOT NULL 
	,	idspa 			INT
    )
    COMMENT "almacena informacion sobre clientes"
    ;
    
     CREATE TABLE RESERVA(
        idreserva    INT PRIMARY KEY AUTO_INCREMENT 
     ,	idcliente    INT
     ,	idempleado   INT
     ,	idhabitacion INT
     ,	fechaentrada DATETIME NOT NULL
     ,  fechasalida  DATETIME NOT NULL  
     ,	cancelacion	 DATETIME DEFAULT NULL 
     ,	idspa        INT
     ) 
     COMMENT "almacena informacion sobre las reservas en general" 
     ; 
     
     CREATE TABLE SPA(
		idspa 		INT PRIMARY KEY  
     ,	direccion 	VARCHAR (100)
	 ,  correo 		VARCHAR (100)
     ,	TELEFONO 	VARCHAR (30)
     )
	 COMMENT "almacena informacion sobre el SPA"
     ; 
     
     CREATE TABLE HABITACION (
		idhabitacion INT PRIMARY KEY AUTO_INCREMENT 
     ,	numerohabitacion INT NOT NULL
     ,  tipohabitacion VARCHAR (50) NOT NULL
     ,  preciohabitacion DECIMAL (10,2)
     ,	disponible BOOLEAN
     ,  idspa INT
     )
     COMMENT "almacena informacion sobre la habitacion y disponibilidad" 
     ; 
        
-- creacion de foreing keys --
 
-- empleado
ALTER TABLE EMPLEADO
	ADD CONSTRAINT FK_EMPLEADO_CLIENTE
    FOREIGN KEY (idspa) REFERENCES SPA (idspa); 
    
-- habitacion
ALTER TABLE HABITACION
	ADD CONSTRAINT FK_SPA_HABITACION
    FOREIGN KEY (idspa) REFERENCES SPA (idspa); 
    
-- reserva
 ALTER TABLE RESERVA
	ADD CONSTRAINT FK_RESERVA_CLIENTE
    FOREIGN KEY (idcliente) REFERENCES CLIENTE (idcliente); 
    
     ALTER TABLE RESERVA
	ADD CONSTRAINT FK_RESERVA_HABITACION
    FOREIGN KEY (idhabitacion) REFERENCES HABITACION (idhabitacion); 
    
     ALTER TABLE RESERVA
	ADD CONSTRAINT FK_RESERVA_EMPLEADO
    FOREIGN KEY (idempleado) REFERENCES EMPLEADO (idempleado); 
    

        