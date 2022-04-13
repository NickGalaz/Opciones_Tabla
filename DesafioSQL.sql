-- 1.- Crear base de datos
CREATE DATABASE posts;

-- 1.1- Ingresar a base de datos posts
\c posts;

-- 2.- Crear tabla post
CREATE TABLE post(
-- Definimos el campo id con el tipo de dato serial y PRIMARY KEY
id SERIAL PRIMARY KEY,
-- Definimos el campo nombre_usuario con el tipo de dato VARCHAR con un largo de 25 caracteres.
nombre_usuario VARCHAR(25),
-- Definimos el campo fecha_de_creacion con el tipo de dato DATE.
fecha_de_creacion DATE,
-- Definimos el campo contenido con el tipo de dato VARCHAR con un largo de 100 caracteres.
contenido VARCHAR (100),
-- Definimos el campo descripcion con el tipo de dato VARCHAR con un largo de 250 caracteres.
descripcion VARCHAR (250)
);

-- 3.- Insertar 3 post dos para Pamela uno para Carlos
INSERT INTO post (nombre_usuario,fecha_de_creacion,contenido,descripcion) VALUES ('Pamela',CURRENT_DATE,'sql1','primer post de Pamela');

INSERT INTO post (nombre_usuario,fecha_de_creacion,contenido,descripcion) VALUES ('Pamela',CURRENT_DATE,'sql1','segundo post de Pamela');

INSERT INTO post (nombre_usuario,fecha_de_creacion,contenido,descripcion) VALUES ('Carlos',CURRENT_DATE,'sql1','primer post de Carlos');


-- 4.- Modificar tabla post agregando campo titulos
ALTER TABLE post ADD titulo VARCHAR (100);

-- 5.- Ingresar titulos a las publicaciones
UPDATE post SET titulo='post usuarios';

-- 6.- Insertar 2 post al usuario Pedro
INSERT INTO post (nombre_usuario,fecha_de_creacion,contenido,descripcion,titulo) VALUES ('Pedro',CURRENT_DATE,'sql1','primer post de Pedro','Post pedro 1');
INSERT INTO post (nombre_usuario,fecha_de_creacion,contenido,descripcion,titulo) VALUES ('Pedro',CURRENT_DATE,'sql1','segundo post de Pedro','Post pedro 2');

-- 7.- Borrar post usuario Carlos
DELETE FROM post WHERE nombre_usuario='Carlos';

-- 8.- Insertar nuevo post para usuario Carlos
INSERT INTO post (nombre_usuario,fecha_de_creacion,contenido,descripcion,titulo) VALUES ('Carlos',CURRENT_DATE,'sql1','segundo post de Carlos','Nuevo post');


--2.- Crear Tabla comentario relacionada con post

CREATE TABLE comentario(
id_post INT,
-- Definimos el campo id_post como FOREIGN KEY relacionada con post
FOREIGN KEY (id_post) REFERENCES post(id),
-- Definimos el campo id con el tipo de dato serial y PRIMARY KEY
id SERIAL PRIMARY KEY,
-- Definimos el campo fecha con el tipo de dato DATE 
fecha DATE,
-- Definimos el campo hora con el tipo de dato TIME.
hora TIME,
-- Definimos el campo contenido con el tipo de dato VARCHAR con un largo de 250 caracteres.
contenido VARCHAR (250)
);

--2.2.- Dos comentario para Pamela y cuatro para Carlos
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (1,CURRENT_DATE,CURRENT_TIME,'Contenido para primer post');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (2,CURRENT_DATE,CURRENT_TIME,'Contenido para segundo post');

INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (6,CURRENT_DATE,CURRENT_TIME,'Primer comentario para Carlos');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (6,CURRENT_DATE,CURRENT_TIME,'Primer comentario para Carlos');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (6,CURRENT_DATE,CURRENT_TIME,'Primer comentario para Carlos');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (6,CURRENT_DATE,CURRENT_TIME,'Cuarto comentario para Carlos');

--2.3 Crear un nuevo post para "Margarita".
INSERT INTO post (nombre_usuario,fecha_de_creacion,contenido,descripcion,titulo) VALUES ('Margarita',CURRENT_DATE,'sql1','primer post de Margarita','Margarita titulo');

--2.4 Ingresar 5 comentarios para post de Margarita.
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (7,CURRENT_DATE,CURRENT_TIME,'Primer comentario para Margarita');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (7,CURRENT_DATE,CURRENT_TIME,'Segundo comentario para Margarita');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (7,CURRENT_DATE,CURRENT_TIME,'Tercero comentario para Margarita');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (7,CURRENT_DATE,CURRENT_TIME,'Cuarto comentario para Margarita');
INSERT INTO comentario (id_post,fecha,hora,contenido) VALUES (7,CURRENT_DATE,CURRENT_TIME,'Quinto comentario para Margarita');


SELECT * FROM post,comentario WHERE post.id=comentario.id_post;


