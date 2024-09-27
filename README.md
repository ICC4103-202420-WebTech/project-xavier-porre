# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization
 rails db:drop db:create db:migrate db:seed 
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

  Detalles de las tablas:
Usuarios

id (Clave Primaria)
nombre_completo
rut (Único)
contraseña
Cursos

id (Clave Primaria)
nombre
usuario_id (Clave Foránea: pertenece a Usuario)
Clases

id (Clave Primaria)
texto
curso_id (Clave Foránea: pertenece a Curso)
Preguntas

id (Clave Primaria)
contenido
usuario_id (Clave Foránea: pertenece a Usuario)
clase_id (Clave Foránea: pertenece a Clase)
Respuestas

id (Clave Primaria)
contenido
usuario_id (Clave Foránea: pertenece a Usuario)
pregunta_id (Clave Foránea: pertenece a Pregunta)
CursosUsuarios

id (Clave Primaria)
usuario_id (Clave Foránea: pertenece a Usuario)
curso_id (Clave Foránea: pertenece a Curso)
Notas:
Relaciones Uno-a-Muchos:
Usuario a Curso: Un usuario puede crear múltiples cursos.
Curso a Clase: Un curso puede tener múltiples clases.
Clase a Pregunta: Una clase puede tener múltiples preguntas.
Pregunta a Respuesta: Una pregunta puede tener múltiples respuestas.
Relación Muchos-a-Muchos:
CursosUsuarios: Un usuario puede inscribirse en múltiples cursos, y un curso puede tener múltiples usuarios inscritos.

