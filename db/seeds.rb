# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Limpiar las tablas
# db/seeds.rb

Usuario.destroy_all

# Crear usuarios (2 creadores de cursos y 3 estudiantes)
usuarios = []
usuarios << Usuario.create!(nombre_completo: "Alice Profesor", rut: "12345678-9", tipo_u: "profesor", contraseña_digest: "password1")
usuarios << Usuario.create!(nombre_completo: "Bob Profesor", rut: "98765432-1", tipo_u: "profesor", contraseña_digest: "password2")
usuarios << Usuario.create!(nombre_completo: "Carlos Estudiante", rut: "12312312-3", tipo_u: "estudiante", contraseña_digest: "password3")
usuarios << Usuario.create!(nombre_completo: "Diana Estudiante", rut: "32132132-4", tipo_u: "estudiante", contraseña_digest: "password4")
usuarios << Usuario.create!(nombre_completo: "Eve Estudiante", rut: "98798798-7", tipo_u: "estudiante", contraseña_digest: "password5")

# Crear cursos (2 por Alice, 2 por Bob)
Curso.destroy_all

# Crear cursos
profesores = Usuario.where(tipo_u: "profesor")
cursos = []
cursos << Curso.create!(nombre: "Curso de Ruby on Rails", creador_id: profesores[0].id, descripcion: "Curso de Ruby on Rails")
cursos << Curso.create!(nombre: "Curso de Programación en Python", creador_id: profesores[1].id, descripcion: "Curso de Python")

Clase.destroy_all

# Crear clases
Clase.create!(texto: "Introducción a Ruby on Rails", imagen: "ruta/a/imagen1.jpg", video: "ruta/a/video1.mp4", curso_id: cursos[0].id)
Clase.create!(texto: "Modelos y Vistas en Rails", imagen: "ruta/a/imagen2.jpg", video: "ruta/a/video2.mp4", curso_id: cursos[0].id)
Clase.create!(texto: "Fundamentos de Python", imagen: "ruta/a/imagen3.jpg", video: "ruta/a/video3.mp4", curso_id: cursos[1].id)
Clase.create!(texto: "Estructuras de Datos en Python", imagen: "ruta/a/imagen4.jpg", video: "ruta/a/video4.mp4", curso_id: cursos[1].id)