class ClasesController < ApplicationController
  def index
    @curso = Curso.find(params[:curso_id])
    @clases = @curso.clases
  end

  def show
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
  
  private
  
  def clase_params
    params.require(:clase).permit(:texto)
  end
  
  
end

