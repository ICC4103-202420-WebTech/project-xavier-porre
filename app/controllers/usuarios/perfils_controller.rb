module Usuarios
    class PerfilsController < ApplicationController
      before_action :authenticate_usuario! # Asegura que el usuario esté autenticado
  
      def show
        @usuario = current_usuario
        @cursos_inscritos = @usuario.cursos
        @cursos_creados = Curso.where(creador_id: @usuario.id) # Cursos creados por el usuario
      end
    end
  end
  