class PreguntasController < ApplicationController
  before_action :set_curso
  before_action :set_clase
  load_and_authorize_resource :clase
  load_and_authorize_resource :pregunta, through: :clase
  def create
    @pregunta = @clase.preguntas.build(pregunta_params)
    @pregunta.usuario = current_usuario

    if @pregunta.save
      redirect_to curso_clase_path(@curso, @clase), notice: "Pregunta publicada exitosamente."
    else
      redirect_to curso_clase_path(@curso, @clase), alert: "Hubo un error al publicar la pregunta."
    end
  end

  private

  # Establecer el curso
  def set_curso
    @curso = Curso.find(params[:curso_id])
  end

  # Establecer la clase
  def set_clase
    @clase = @curso.clases.find(params[:clase_id])
  end

  # Permitir parámetros para la pregunta
  def pregunta_params
    params.require(:pregunta).permit(:texto)
  end
end
