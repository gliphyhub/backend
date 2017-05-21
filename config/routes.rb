Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/basededatos', as: 'rails_admin'
  resources :publicaciones
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  authenticated :user do
  	root 'home#index' 	
  end
  unauthenticated :user do
  	root 'home#bienvenida' 	
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
