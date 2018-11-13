Rails.application.routes.draw do
  get 'dashboards/index'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/index'
  devise_for :users
  root to: 'pages#home'
  get 'design', to: 'pages#design'
  resources :artifacts, only: [:index, :show, :new, :create]
  post 'bookings', to: 'bookings#create'
  get 'artifacts/:id/contact', to: 'contacts#new'
  post 'contacts', to: 'contacts#create'
  get 'dashboard', to: 'dashboards#index'
end
