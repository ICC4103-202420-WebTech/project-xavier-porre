class CursosController < ApplicationController
  def index
    @cursos = Curso.all
  end

  def show
    @curso = Curso.find(params[:id])
    @clases = @curso.clases
  end
end
