class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      session[:usuario_id] = @usuario.id  # Inicia sesión automáticamente
      redirect_to root_path, notice: "Usuario creado exitosamente."
    else
      render :new
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre_completo, :email, :contraseña_digest, :tipo_u)
  end
end

