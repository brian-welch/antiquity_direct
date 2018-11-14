Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'


  # resources :artifacts, only: [:index, :show, :new, :create] do
  #   resources :bookings, only: [ :create ]
  # end


  resources :artifacts, only: [:index, :show, :new, :create]
  resources :bookings, only: [ :create ]



  get 'artifacts/:id/contact', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'
  get 'dashboard', to: 'dashboards#index', as: "dashboard"
end
