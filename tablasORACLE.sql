CREATE TABLE socios (
    socio varchar2(1),
    nombre varchar2(50),
    fecha_alta date DEFAULT sysdate,
    telefono varchar2(9) NOT NULL,
    dni varchar2(9),
    direccion varchar2(50),
CONSTRAINT pk_socios PRIMARY KEY (socio),
CONSTRAINT uq_dni UNIQUE (dni),
CONSTRAINT ck_fecha_alta CHECK (fecha_alta BETWEEN to_date ('2000-01-01', 'yyyy-mm-dd') AND to_date ('2080-12-31', 'yyyy-mm-dd'))
);

CREATE TABLE peliculas (
    pelicula varchar2(1),
    titulo varchar2(30),
    tema varchar2(8),
    ano varchar2(4),
    pais varchar2(20),
    precio number(2,1),
CONSTRAINT pk_peliculas PRIMARY KEY (pelicula),
CONSTRAINT ck_precio CHECK  (precio > 0 AND precio < 5),
CONSTRAINT ck_tema CHECK (tema IN ('Comedia','Drama','Accion','Suspense')),
CONSTRAINT ck_ano CHECK (REGEXP_LIKE(ano, '[0-9]{4}'))
);

CREATE TABLE alquiler (
    socio varchar2(1),
    pelicula varchar2(1),
    fecha_alquiler date,
    fecha_devolucion date,
CONSTRAINT pk_alquiler PRIMARY KEY (socio,pelicula,fecha_alquiler),
CONSTRAINT fk_alquiler1 foreign KEY (socio) references socios (socio),
CONSTRAINT fk_alquiler2 foreign key (pelicula) references peliculas (pelicula),
CONSTRAINT ck_fecha_alquiler CHECK (fecha_alquiler BETWEEN to_date ('2000-01-01', 'yyyy-mm-dd') AND to_date ('2080-12-31', 'yyyy-mm-dd')),
CONSTRAINT ck_fecha_devolucion CHECK (fecha_devolucion BETWEEN to_date ('2000-01-01', 'yyyy-mm-dd') AND to_date ('2080-12-31', 'yyyy-mm-dd'))
);

INSERT INTO socios VALUES ('1','Antonio Olmo Garcia',to_date('2010-01-20', 'yyyy-mm-dd'),'645277415','27711498D','Baeza 12 5A');
INSERT INTO socios VALUES ('2','Miguel Armas Ruiz',to_date('2010-05-23', 'yyyy-mm-dd'),'655232367','28565225C','La Veleta, 25');
INSERT INTO socios VALUES ('3','Antonio Lopez Carmona',to_date('2009-04-13', 'yyyy-mm-dd'),'645234562','23106595D','Alamos, 23 2ºB');
INSERT INTO socios VALUES ('4','Teresa Sanchez Lopez',to_date('2009-08-22', 'yyyy-mm-dd'),'645237648','27148934G','Cerón, 3');
INSERT INTO socios VALUES ('5','Maria Marmol Lopez',to_date('2010-12-12', 'yyyy-mm-dd'),'655404145','27003478W','Avda. Madrid, 9, 7ºA');
INSERT INTO socios VALUES ('6','Rafael Montoto Hoz',to_date('2009-05-11', 'yyyy-mm-dd'),'655908070','23785632G','La luna, 2');
INSERT INTO socios VALUES ('7','Nuria Perez Cano',to_date('2010-11-02', 'yyyy-mm-dd'),'645121978','23451267Q','Almeria, 12 2ºA');

INSERT INTO peliculas VALUES ('1','Felpudo Maldito','Comedia','1995','Francia',4);
INSERT INTO peliculas VALUES ('2','Two Much','Comedia','1995','Espana',3.5);
INSERT INTO peliculas VALUES ('3','El dia de la bestia','Comedia','1995','Espana',3);
INSERT INTO peliculas VALUES ('4','Extasis','Drama','1996','Espana',4);
INSERT INTO peliculas VALUES ('5','Tesis','Suspense','1995','Espana',4.5);
INSERT INTO peliculas VALUES ('6','Apolo 13','Accion','1995','Espana',3);
INSERT INTO peliculas VALUES ('7','Desperado','Accion','1995','EEUU',3);
INSERT INTO peliculas VALUES ('8','Pena de muerte','Drama','1996','EEUU',2.5);

INSERT INTO alquiler VALUES ('1','4',to_date('2010-07-12', 'yyyy-mm-dd'),to_date('2010-07-13', 'yyyy-mm-dd'));
INSERT INTO alquiler VALUES ('3','7',to_date('2010-09-11', 'yyyy-mm-dd'),to_date('2010-09-13', 'yyyy-mm-dd'));
INSERT INTO alquiler VALUES ('4','3',to_date('2011-01-24', 'yyyy-mm-dd'),NULL);
INSERT INTO alquiler VALUES ('4','5',to_date('2011-01-01', 'yyyy-mm-dd'),to_date('2011-01-03', 'yyyy-mm-dd'));
INSERT INTO alquiler VALUES ('2','2',to_date('2011-01-21', 'yyyy-mm-dd'),NULL);
INSERT INTO alquiler VALUES ('5','1',to_date('2011-01-24', 'yyyy-mm-dd'),NULL);
INSERT INTO alquiler VALUES ('1','7',to_date('2011-01-22', 'yyyy-mm-dd'),to_date('2011-01-23', 'yyyy-mm-dd'));

INSERT INTO alquiler VALUES ('1','3',to_date('2011-01-22', 'yyyy-mm-dd'),to_date('2011-01-23', 'yyyy-mm-dd'));
