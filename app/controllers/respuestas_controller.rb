class RespuestasController < ApplicationController
  before_action :set_curso
  before_action :set_clase
  before_action :set_pregunta

  def create
    @respuesta = @pregunta.respuestas.build(respuesta_params)
    @respuesta.usuario = current_usuario

    if @respuesta.save
      redirect_to curso_clase_path(@curso, @clase), notice: "Respuesta publicada exitosamente."
    else
      redirect_to curso_clase_pregunta_path(@curso, @clase, @pregunta), alert: "Hubo un error al publicar la respuesta."
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

  # Establecer la pregunta
  def set_pregunta
    @pregunta = @clase.preguntas.find(params[:pregunta_id])
  end

  # Permitir parámetros para la respuesta
  def respuesta_params
    params.require(:respuesta).permit(:texto)
  end
end
