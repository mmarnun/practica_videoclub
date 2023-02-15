CREATE TABLE socios (
    socio varchar(1),
    nombre varchar(50),
    fecha_alta date DEFAULT now(),
    telefono varchar(9) NOT NULL,
    dni varchar(9),
    direccion varchar(50),
CONSTRAINT pk_socios PRIMARY KEY (socio),
CONSTRAINT uq_dni UNIQUE (dni),
CONSTRAINT ck_fecha_alta CHECK (fecha_alta BETWEEN '2000-01-01'AND '2080-12-31')
);

CREATE TABLE peliculas (
    pelicula varchar(1),
    titulo varchar(30),
    tema varchar(8),
    ano varchar(4),
    pais varchar(20),
    precio decimal(2,1),
CONSTRAINT pk_peliculas PRIMARY KEY (pelicula),
CONSTRAINT ck_precio CHECK  (precio > 0 AND precio < 5),
CONSTRAINT ck_tema CHECK (tema IN ('Comedia','Drama','Accion','Suspense')),
CONSTRAINT ck_ano CHECK (ano REGEXP '[0-9]{4}')
);

CREATE TABLE alquiler (
    socio varchar(1),
    pelicula varchar(1),
    fecha_alquiler date,
    fecha_devolucion date,
CONSTRAINT pk_alquiler PRIMARY KEY (socio,pelicula,fecha_alquiler),
CONSTRAINT fk_alquiler1 foreign KEY (socio) references socios (socio),
CONSTRAINT fk_alquiler2 foreign key (pelicula) references peliculas (pelicula),
CONSTRAINT ck_fecha_alquiler CHECK (fecha_alquiler BETWEEN '2000-01-01' AND '2080-12-31'),
CONSTRAINT ck_fecha_devolucion CHECK (fecha_devolucion BETWEEN '2000-01-01' AND '2080-12-31')
);

INSERT INTO socios VALUES ('1','Antonio Olmo Garcia','2010-01-20','645277415','27711498D','Baeza 12 5A');
INSERT INTO socios VALUES ('2','Miguel Armas Ruiz','2010-05-23','655232367','28565225C','La Veleta, 25');
INSERT INTO socios VALUES ('3','Antonio Lopez Carmona','2009-04-13','645234562','23106595D','Alamos, 23 2ºB');
INSERT INTO socios VALUES ('4','Teresa Sanchez Lopez','2009-08-22','645237648','27148934G','Cerón, 3');
INSERT INTO socios VALUES ('5','Maria Marmol Lopez','2010-12-12','655404145','27003478W','Avda. Madrid, 9, 7ºA');
INSERT INTO socios VALUES ('6','Rafael Montoto Hoz','2009-05-11','655908070','23785632G','La luna, 2');
INSERT INTO socios VALUES ('7','Nuria Perez Cano','2010-11-02','645121978','23451267Q','Almeria, 12 2ºA');

INSERT INTO peliculas VALUES ('1','Felpudo Maldito','Comedia','1995','Francia',4);
INSERT INTO peliculas VALUES ('2','Two Much','Comedia','1995','Espana',3.5);
INSERT INTO peliculas VALUES ('3','El dia de la bestia','Comedia','1995','Espana',3);
INSERT INTO peliculas VALUES ('4','Extasis','Drama','1996','Espana',4);
INSERT INTO peliculas VALUES ('5','Tesis','Suspense','1995','Espana',4.5);
INSERT INTO peliculas VALUES ('6','Apolo 13','Accion','1995','Espana',3);
INSERT INTO peliculas VALUES ('7','Desperado','Accion','1995','EEUU',3);
INSERT INTO peliculas VALUES ('8','Pena de muerte','Drama','1996','EEUU',2.5);

INSERT INTO alquiler VALUES ('1','4','2010-07-12','2010-07-13');
INSERT INTO alquiler VALUES ('3','7','2010-09-11','2010-09-13');
INSERT INTO alquiler VALUES ('4','3','2011-01-24',NULL);
INSERT INTO alquiler VALUES ('4','5','2011-01-01','2011-01-03');
INSERT INTO alquiler VALUES ('2','2','2011-01-21',NULL);
INSERT INTO alquiler VALUES ('5','1','2011-01-24',NULL);
INSERT INTO alquiler VALUES ('1','7','2011-01-22','2011-01-23');

INSERT INTO alquiler VALUES ('1','3','2011-01-22','2011-01-23');
