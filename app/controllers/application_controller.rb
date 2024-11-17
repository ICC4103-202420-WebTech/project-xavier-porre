class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre_completo, :rut, :tipo_u])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre_completo, :rut, :tipo_u])
  end
  before_action :authenticate_usuario!

  # Cancancan: establecer el usuario actual
  def current_ability
    @current_ability ||= Ability.new(current_usuario)
  end 


end
