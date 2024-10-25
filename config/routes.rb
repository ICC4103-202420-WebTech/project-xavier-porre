Rails.application.routes.draw do
  get "clases/index"
  get "clases/show"
  get "usuarios/new"
  get "cursos/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  root 'cursos#index'
  
  resources :usuarios, only: [:new, :create]  # Rutas para crear usuarios
  get 'iniciar_sesion', to: 'sesiones#new', as: 'iniciar_sesion'
  post 'iniciar_sesion', to: 'sesiones#create'
  delete 'cerrar_sesion', to: 'usuarios#destroy', as: :logout


  resources :cursos do
    resources :clases, only: [:new, :create, :show, :index]
  end
  
end
