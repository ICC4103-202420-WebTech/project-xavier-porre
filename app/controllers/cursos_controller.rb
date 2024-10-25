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
    @curso.creador_id = session[:usuario_id] 

    if @curso.save
      redirect_to @curso, notice: 'Curso creado exitosamente.'
    else
      @profesores = Usuario.where(tipo_u: "profesor")
      render :new
    end
  end

  private

  def curso_params
    params.require(:curso).permit(:nombre, :descripcion) 
  end
  
end

