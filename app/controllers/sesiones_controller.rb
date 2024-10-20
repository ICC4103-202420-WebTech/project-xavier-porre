class SesionesController < ApplicationController
    def new
      # Muestra el formulario de inicio de sesión
    end
  
    def create
      usuario = Usuario.find_by(rut: params[:rut])
      if usuario.nil?
        flash.now[:alert] = "El usuario no existe."
        render :new and return
      end
    
      if usuario.authenticate(params[:password])
        session[:usuario_id] = usuario.id
        redirect_to root_path, notice: "Has iniciado sesión correctamente."
      else
        flash.now[:alert] = "Contraseña incorrecta."
        render :new
      end
    end
    
  
    def destroy
      session[:usuario_id] = nil
      redirect_to root_path, notice: "Has cerrado sesión correctamente."
    end
  end
  
