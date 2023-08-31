create database elecciones;
use elecciones;
-- Crear la tabla Votantes
CREATE TABLE Votantes (
    numero_cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    carrera VARCHAR(50),
    semestre VARCHAR(50)
);
CREATE TABLE Candidatos (
    numero_cedula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    carrera VARCHAR(50),
    semestre VARCHAR(50)
);
-- Crear la tabla Elecciones
CREATE TABLE Elecciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    estado ENUM('abiertas', 'cerradas'),
    descripcion TEXT
);

-- Crear la tabla Votos
CREATE TABLE Votos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    eleccion_id INT,
    votante_cedula VARCHAR(20),
    candidato_cedula VARCHAR(20),
    fecha_voto TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (eleccion_id) REFERENCES Elecciones(id),
    FOREIGN KEY (votante_cedula) REFERENCES Votantes(numero_cedula),
    FOREIGN KEY (candidato_cedula) REFERENCES Candidatos(numero_cedula)
);