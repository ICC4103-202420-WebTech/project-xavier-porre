class ClasesController < ApplicationController

  def index
    @curso = Curso.find(params[:curso_id])
    @clases = @curso.clases
 end

  def show
    @curso = Curso.find(params[:curso_id])
    @clase = Clase.find(params[:id])
  end

  def new
    @curso = Curso.find(params[:curso_id])
    @clase = @curso.clases.build
  end

  def create
    @curso = Curso.find(params[:curso_id])
    @clase = @curso.clases.build(clase_params)
  
    if @clase.save
      redirect_to curso_path(@curso), notice: 'La clase fue creada exitosamente.'
    else
      render :new
    end
  end

  def edit
    @curso = Curso.find(params[:curso_id])
    @clase = @curso.clases.find(params[:id])
  end

  def update
    @curso = Curso.find(params[:curso_id])
    @clase = @curso.clases.find(params[:id])

    if @clase.update(clase_params)
      redirect_to @curso, notice: 'Clase actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @curso = Curso.find(params[:curso_id])      # Encuentra el curso
    @clase = @curso.clases.find(params[:id])    # Encuentra la clase dentro de ese curso

    if @clase.destroy
      redirect_to curso_path(@curso), notice: 'Clase eliminada exitosamente.'
    else
      redirect_to curso_path(@curso), alert: 'Hubo un error al eliminar la clase.'
    end
  end
  private
  
  def clase_params
    params.require(:clase).permit(:texto, :texto2)
  end
  
  
end

