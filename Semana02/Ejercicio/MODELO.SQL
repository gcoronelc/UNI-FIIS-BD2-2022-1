-- DBMS           :  SQL Server
-- Base de Datos  :  DBClinica
-- Script         :  Crea los objetos de la base de datos
-- Responsable    :  Eric Gustavo Coronel Castillo
--                   Email: gcoronelc@gmail.com
--                   Site: gcoronelc.blogspot.com
--                   Canal: www.youtube.com/c/DesarrollaSoftware


-- ======================================================
-- CREA LA BASE DE DATOS
-- ======================================================

USE master;
GO

IF( NOT EXISTS ( SELECT 1 FROM sys.sysdatabases WHERE name='DBClinica' ) )
BEGIN
	CREATE DATABASE DBClinica;
END;
GO

USE DBClinica;
GO

-- ======================================================
-- ELIMINA TABLA
-- ======================================================

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='ATENCION' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ATENCION;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='COMPROBANTE' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.COMPROBANTE;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='CITA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.CITA;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='PROGRAMACION' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.PROGRAMACION;
END;
GO


IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='EMPLEADO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.EMPLEADO;
END;
GO



IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='PACIENTE' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.PACIENTE;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='TURNO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.TURNO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='CONSULTORIO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.CONSULTORIO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='MEDICO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.MEDICO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='ROL' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ROL;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='ESPECIALIDAD' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ESPECIALIDAD;
END;
GO


IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='ENFERMERA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ENFERMERA;
END;
GO

-- ======================================================
-- CREACION DE TABLAS
-- ======================================================


CREATE TABLE dbo.ENFERMERA
( 
	IDENFERMERA          integer  NOT NULL ,
	NOMBRE               varchar(100)  NOT NULL ,
	APELLIDO             varchar(100)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	CELULAR              varchar(20)  NULL ,
	CORREO               varchar(100)  NULL ,
	CONSTRAINT XPKENFERMERA PRIMARY KEY (IDENFERMERA ASC)
)
go



CREATE TABLE dbo.ESPECIALIDAD
( 
	IDESPECIALIDAD       integer  NOT NULL ,
	NOMBRE               varchar(100)  NOT NULL ,
	COSTOCONSULTA        money  NOT NULL ,
	CONSTRAINT XPKESPECIALIDAD PRIMARY KEY (IDESPECIALIDAD ASC)
)
go



CREATE TABLE dbo.CONSULTORIO
( 
	IDCONSULTORIO        integer IDENTITY ( 1,1 ) ,
	PISO                 varchar(20)  NOT NULL ,
	NUMERO               varchar(20)  NOT NULL ,
	DISPONBLE            integer  NOT NULL 
	CONSTRAINT DF_CONSULTORIO_DISPONIBLE
		 DEFAULT  0,
	CONSTRAINT XPKCONSULTORIO PRIMARY KEY (IDCONSULTORIO ASC)
)
go



CREATE TABLE dbo.TURNO
( 
	IDTURNO              integer  NOT NULL ,
	NOMBRE               varchar(50)  NULL ,
	CONSTRAINT XPKTURNO PRIMARY KEY (IDTURNO ASC)
)
go



CREATE TABLE dbo.ROL
( 
	IDROL                integer  NOT NULL ,
	NOMBRE               varchar(60)  NOT NULL ,
	CONSTRAINT XPKROL PRIMARY KEY (IDROL ASC)
)
go



CREATE TABLE dbo.EMPLEADO
( 
	IDEMPLEADO           integer  NOT NULL ,
	IDROL                integer  NOT NULL ,
	NOMBRE               varchar(100)  NOT NULL ,
	APELLIDO             varchar(100)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	CELULAR              varchar(20)  NULL ,
	CORREO               varchar(100)  NULL ,
	CONSTRAINT XPKEMPLEADO PRIMARY KEY (IDEMPLEADO ASC),
	CONSTRAINT FK_EMPLEADO_ROL FOREIGN KEY (IDROL) REFERENCES dbo.ROL(IDROL)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE dbo.MEDICO
( 
	IDMEDICO             integer IDENTITY ( 1,1 ) ,
	NOMBRE               varchar(100)  NOT NULL ,
	APELLIDO             varchar(100)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	CELULAR              varchar(20)  NULL ,
	CORREO               varchar(100)  NULL ,
	IDESPECIALIDAD       integer  NOT NULL ,
	CONSTRAINT XPKMEDICO PRIMARY KEY (IDMEDICO ASC),
	CONSTRAINT FK_MEDICO_ESPECIALIDAD FOREIGN KEY (IDESPECIALIDAD) REFERENCES dbo.ESPECIALIDAD(IDESPECIALIDAD)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE dbo.PACIENTE
( 
	IDPACIENTE           integer IDENTITY ( 1,1 ) ,
	NOMBRE               varchar(100)  NOT NULL ,
	APELLIDO             varchar(100)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	CELULAR              varchar(20)  NULL ,
	CORREO               varchar(100)  NULL ,
	CONSTRAINT XPKPACIENTE PRIMARY KEY (IDPACIENTE ASC)
)
go
