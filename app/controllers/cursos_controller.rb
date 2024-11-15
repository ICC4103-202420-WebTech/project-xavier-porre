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
    @curso.creador_id = current_usuario.id

    if @curso.save
      redirect_to @curso, notice: 'Curso creado exitosamente.'
    else
      @profesores = Usuario.where(tipo_u: "profesor")
      render :new
    end
  end

  def edit
    @curso = Curso.find_by(id: params[:id])
    unless @curso
      redirect_to cursos_path, alert: "Curso no encontrado."
    end
  end

  def update
    @curso = Curso.find(params[:id]) # Cargar el curso aquí también
    if @curso.update(curso_params)
      redirect_to @curso, notice: 'Curso actualizado exitosamente.'
    else
      render :edit, alert: 'Hubo un error al actualizar el curso.'
    end
  end
  
  def destroy
    @curso = Curso.find(params[:id])  # Encuentra el curso
    # Verifica si el curso tiene clases asociadas
    if @curso.clases.any?
      # Si tiene clases, las elimina junto con el curso
      @curso.destroy
      redirect_to cursos_path, notice: 'Curso y sus clases eliminados exitosamente.'
    else
      # Si no tiene clases asociadas, elimina el curso directamente
      @curso.destroy
      redirect_to cursos_path, notice: 'Curso eliminado exitosamente.'
    end
  end
  

  def confirmar_borrado
    @curso = Curso.find(params[:id])  # Encuentra el curso
  end
  
  

  private

  def curso_params
    params.require(:curso).permit(:nombre, :descripcion2) 
  end
end

