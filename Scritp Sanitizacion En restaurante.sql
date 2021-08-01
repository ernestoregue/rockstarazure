CREATE DATABASE SanitizaciOn_en_Restaurante;
USE SanitizaciOn_en_Restaurante;
CREATE TABLE EncargadoRestaurante
(
    id_Encargado INT NOT NULL,
    PRIMARY KEY (id_Encargado),
    NombreEncargado VARCHAR(50) NOT NULL,
    Curp NVARCHAR(25) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion NVARCHAR(45) NOT NULL,
    Estado VARCHAR(25) NOT NULL,
    Municipio VARCHAR(25) NOT NULL
);
CREATE TABLE Lugares
(
    id_Lugares INT NOT NULL,
    id_Encargado INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Pais VARCHAR(45) NOT NULL,
    Estado VARCHAR(25) NOT NULL,
    Municipio VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_Lugares),
    INDEX (id_Encargado), 
    FOREIGN KEY (id_Encargado) REFERENCES EncargadoRestaurante(id_Encargado)
);
CREATE TABLE PersonalCalificado
(
    id_PersonalCalificado INT NOT NULL,
    PRIMARY KEY (id_PersonalCalificado),
    Nombre VARCHAR(50) NOT NULL,
    Curp NVARCHAR(25) NOT NULL,
    FechaNacimiento DATE NOT NULL
);
CREATE TABLE Certificado
(
    id_IdCertificado INT NOT NULL,
    id_lugar INT NOT NULL,
	id_PersonalCapacitado INT NOT NULL,
    PRIMARY KEY (id_IdCertificado),
    INDEX (id_lugar), 
    FOREIGN KEY (id_lugar) REFERENCES Lugares(id_Lugares),
	INDEX (id_PersonalCapacitado), 
    FOREIGN KEY (id_PersonalCapacitado ) REFERENCES PersonalCalificado(id_PersonalCalificado)
);
CREATE TABLE Solicitudes
(
    id_Solicitudes INT NOT NULL,
    id_Encargado INT NOT NULL,
    id_PersonalCapacitado INT NOT NULL,
    id_Lugar INT NOT NULL,
    Direccion NVARCHAR(45),
    FechaDeSolicitud DATE,
    PRIMARY KEY (id_Solicitudes),
    INDEX (id_Encargado), 
    FOREIGN KEY (id_Encargado) REFERENCES EncargadoRestaurante(id_Encargado),
    INDEX (id_PersonalCapacitado), 
    FOREIGN KEY (id_PersonalCapacitado ) REFERENCES PersonalCalificado(id_PersonalCalificado),
	INDEX (id_lugar), 
    FOREIGN KEY (id_lugar) REFERENCES Lugares(id_Lugares)
);
CREATE TABLE RestaurantesCertificados
(
    id_ResCerti INT NOT NULL,
    id_Encargado INT NOT NULL,
    id_PersonalCapacitado INT NOT NULL,
    id_Lugar INT NOT NULL,
    FechaAprovado DATE,
    PRIMARY KEY (id_ResCerti),
    INDEX (id_Encargado), 
    FOREIGN KEY (id_Encargado) REFERENCES EncargadoRestaurante(id_Encargado),
    INDEX (id_PersonalCapacitado), 
    FOREIGN KEY (id_PersonalCapacitado ) REFERENCES PersonalCalificado(id_PersonalCalificado),
	INDEX (id_lugar), 
    FOREIGN KEY (id_lugar) REFERENCES Lugares(id_Lugares)
);

