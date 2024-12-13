-- Tabla Cliente
CREATE TABLE Cliente (
idCliente INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
empresa VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL
);

-- Tabla Proyecto
CREATE TABLE Proyecto (
id_Proyecto INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estado VARCHAR(20) NOT NULL,
fecha_de_inicio DATETIME NOT NULL,
fecha_de_fin DATETIME NOT NULL,
idCliente INT NOT NULL,
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Empleado
CREATE TABLE Empleado (
idEmpleado INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
cargo VARCHAR(50) NOT NULL
);

-- Tabla Equipo (Humanos)
CREATE TABLE Equipo (
id_Equipo INT PRIMARY KEY,
nombreEquipo VARCHAR(50) NOT NULL
);

-- Relación Empleado - Equipo
CREATE TABLE Empleado_Equipo (
idEmpleado INT NOT NULL,
idEquipo INT NOT NULL,
PRIMARY KEY (idEmpleado, idEquipo),
FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
FOREIGN KEY (idEquipo) REFERENCES Equipo(id_Equipo)
);

-- Tabla Maquinaria
CREATE TABLE Maquinaria (
id_Maquinaria INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
tipo VARCHAR(50) NOT NULL,
capacidad VARCHAR(50) NOT NULL
);

-- Tabla Recurso
CREATE TABLE Recurso (
id_Recurso INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
tipo VARCHAR(50) NOT NULL,
cantidad INT NOT NULL
);

-- Relación Recurso - Proyecto
CREATE TABLE Recurso_Proyecto (
idRecursoProyecto INT PRIMARY KEY,
id_Recurso INT NOT NULL,
id_Proyecto INT NOT NULL,
descripcion VARCHAR(50),
FOREIGN KEY (id_Recurso) REFERENCES Recurso(id_Recurso),
FOREIGN KEY (id_Proyecto) REFERENCES Proyecto(id_Proyecto)
);

-- Relación Maquinaria - Proyecto
CREATE TABLE Maquinaria_Proyecto (
idMaquinariaProyecto INT PRIMARY KEY,
id_Maquinaria INT NOT NULL,
id_Proyecto INT NOT NULL,
descripcion VARCHAR(50),
FOREIGN KEY (id_Maquinaria) REFERENCES Maquinaria(id_Maquinaria),
FOREIGN KEY (id_Proyecto) REFERENCES Proyecto(id_Proyecto)
);

-- Tabla Tarea
CREATE TABLE Tarea (
id_Tarea INT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
fecha_de_inicio DATETIME NOT NULL,
fecha_de_fin DATETIME NOT NULL,
id_Proyecto INT NOT NULL,
FOREIGN KEY (id_Proyecto) REFERENCES Proyecto(id_Proyecto)
);

-- Relación Empleado - Tarea
CREATE TABLE Empleado_Tarea (
idEmpleadoTarea INT PRIMARY KEY,
idEmpleado INT NOT NULL,
id_Tarea INT NOT NULL,
descripcion VARCHAR(50),
FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
FOREIGN KEY (id_Tarea) REFERENCES Tarea(id_Tarea)
);

-- Datos de prueba para las tablas independientes
INSERT INTO Cliente VALUES (1, 'Juan', 'Pérez', 'Empresa1', 'juan.perez@empresa1.com');
INSERT INTO Cliente VALUES (2, 'Ana', 'García', 'Empresa2', 'ana.garcia@empresa2.com');
INSERT INTO Empleado VALUES (1, 'Luis', 'Martínez', 'luis.martinez@correo.com', 'Desarrollador');
INSERT INTO Empleado VALUES (2, 'María', 'López', 'maria.lopez@correo.com', 'Analista');
INSERT INTO Equipo VALUES (1, 'Equipo Alpha');
INSERT INTO Maquinaria VALUES (1, 'Excavadora', 'Pesada', '500kg');
INSERT INTO Recurso VALUES (1, 'Cemento', 'Material', 100);

-- Datos de prueba para las tablas transaccionales
INSERT INTO Proyecto VALUES (1, 'Construcción de Puente', 'Puente principal de la ciudad', 'En Proceso', '2024-01-01', '2024-12-31', 1);
INSERT INTO Recurso_Proyecto VALUES (1, 1, 1, 'Recurso utilizado en cimentación');
INSERT INTO Maquinaria_Proyecto VALUES (1, 1, 1, 'Maquinaria utilizada en cimentación');
INSERT INTO Tarea VALUES (1, 'Diseño Inicial', 'Diseño del puente', '2024-01-01', '2024-02-01', 1);
INSERT INTO Empleado_Tarea VALUES (1, 1, 1, 'Empleado encargado del diseño inicial');

