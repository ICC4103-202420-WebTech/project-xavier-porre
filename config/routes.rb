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
    resources :clases, only: [:new, :create, :show, :index, :edit, :update, :destroy]
    
    # Rutas para inscribir y desinscribir estudiantes
    member do
      post :inscribir      # POST /cursos/:id/inscribir
      delete :desinscribir # DELETE /cursos/:id/desinscribir
    end
  end

  #rutas para manejar progreso de clases
  resources :clases do
    resources :progresos, only: [:create, :update]
    # Rutas para preguntas dentro de las clases
    resources :preguntas, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  
  namespace :usuarios do
    resource :perfil, only: :show
  end

  resources :cursos do
    resources :clases do
      resources :preguntas do
        resources :respuestas, only: [:create]
      end
    end
  end
  
  #correcion para reconocer plantillas en ususarios 
  devise_for :usuarios, controllers: {
    registrations: 'usuarios/registrations',
    sessions: 'usuarios/sessions'
  }
  
   

  # Define the root path rout
  root 'cursos#index'
end

