Rails.application.routes.draw do


  # Rutas adicionales para clases y cursos
  get "clases/index"
  get "clases/show"
  get "cursos/index"
  
  # Rutas de salud y PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Rutas para los cursos y clases
  resources :cursos do
    resources :clases, only: [:new, :create, :show, :index, :destroy]
  end

  #correcion para reconocer plantillas en ususarios 
  devise_for :usuarios, controllers: {
    registrations: 'usuarios/registrations',
    sessions: 'usuarios/sessions'
  }
  

  # Define the root path rout
  root 'cursos#index'
end

