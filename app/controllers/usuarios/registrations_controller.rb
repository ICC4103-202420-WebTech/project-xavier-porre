# app/controllers/usuarios/registrations_controller.rb
module Usuarios
    class RegistrationsController < Devise::RegistrationsController
      # Acción para crear un nuevo usuario
      def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
          sign_in(@usuario)  # Inicia sesión automáticamente con Devise
          redirect_to root_path, notice: "Usuario creado exitosamente."
        else
          render :new
        end
      end
  
      private
  
      def usuario_params
        params.require(:usuario).permit(:nombre_completo, :rut, :email, :password, :password_confirmation, :tipo_u)
      end
    end
  end
  