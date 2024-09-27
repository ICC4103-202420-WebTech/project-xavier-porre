class SesionesController < ApplicationController
    def new
      # Muestra el formulario de inicio de sesión
    end
  
    def create
      usuario = Usuario.find_by(rut: params[:rut])
      if usuario&.authenticate(params[:contraseña])
        session[:usuario_id] = usuario.id
        redirect_to root_path, notice: "Has iniciado sesión correctamente."
      else
        flash.now[:alert] = "Rut o contraseña incorrectos."
        render :new
      end
    end
  
    def destroy
      session[:usuario_id] = nil
      redirect_to root_path, notice: "Has cerrado sesión correctamente."
    end
  end
  
