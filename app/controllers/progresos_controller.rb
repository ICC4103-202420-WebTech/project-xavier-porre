class ProgresosController < ApplicationController
  def create
    @clase = Clase.find(params[:clase_id])  # Encuentra la clase asociada
    @progreso = @clase.progresos.new(progreso_params)
    @progreso.usuario = current_usuario # Asocia al usuario actual
  
    if @progreso.save
      redirect_to @clase, notice: 'Progreso guardado exitosamente.'
    else
      redirect_to @clase, alert: 'Hubo un error al guardar el progreso.'
    end
  end

  def update
    @progreso = Progreso.find(params[:id])
    
    if @progreso.update(progreso_params)
      # Si la solicitud es AJAX, respondemos con JSON
      respond_to do |format|
        format.json { render json: { success: true, message: 'Progreso actualizado exitosamente.' } }
        format.html { redirect_to @progreso.clase, notice: 'Progreso actualizado exitosamente.' }
      end
    else
      respond_to do |format|
        format.json { render json: { success: false, message: 'Hubo un error al actualizar el progreso.' } }
        format.html { redirect_to @progreso.clase, alert: 'Hubo un error al actualizar el progreso.' }
      end
    end
  end

  private

  def set_clase
    @clase = Clase.find(params[:clase_id])
  end

  def progreso_params
    params.require(:progreso).permit(:completado, :usuario_id, :clase_id)
  end
  
end
