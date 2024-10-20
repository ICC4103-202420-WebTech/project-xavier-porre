class CursosController < ApplicationController
  def index
    @cursos = Curso.all
  end

  def show
    @curso = Curso.find(params[:id])
    @clases = @curso.clases
  end
  
  def new
    @curso = Curso.new
    @profesores = Usuario.where(tipo_u: "profesor")
  end

  def create
    @curso = Curso.new(curso_params)
    @curso.creador_id = current_usuario.id # Asegúrate de que `current_usuario` está definido

    if @curso.save
      redirect_to @curso, notice: 'Curso creado exitosamente.'
    else
      @profesores = Usuario.where(tipo_u: "profesor")
      render :new
    end
  end

  private

  def curso_params
    params.require(:curso).permit(:nombre, :descripcion) # Eliminar :creador_id, ya que ahora se asigna en el controlador
  end
  
end

