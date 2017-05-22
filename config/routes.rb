Rails.application.routes.draw do
  resources :perfil_alumnos
  resources :perfil_tutores
  resources :perfil_profesores
  resources :perfil_admins
  mount RailsAdmin::Engine => '/basededatos', as: 'rails_admin'
  resources :publicaciones

  #devise_for :users, controllers: { registrations: 'users/registrations' }
  #devise_scope :user do
  #  get '/users/sign_out' => 'devise/sessions#destroy'
  #end

  devise_for :users, skip: :registrations
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'users/registrations',

      as: :user_registration do
        get :cancel
      end
  end

  authenticated :user do
  	root 'home#index' 	
  end
  unauthenticated :user do
  	root 'home#bienvenida' 	
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
