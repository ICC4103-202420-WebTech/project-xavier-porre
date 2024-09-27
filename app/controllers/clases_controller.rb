class ClasesController < ApplicationController
  def index
    @curso = Curso.find(params[:curso_id])
    @clases = @curso.clases
  end

  def show
    @clase = Clase.find(params[:id])
  end
end

