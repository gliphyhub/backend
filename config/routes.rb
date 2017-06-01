Rails.application.routes.draw do
  resources :comunicados
  resources :perfil_alumnos#, only: [:create]
  resources :perfil_tutores#, only: [:create]
  resources :perfil_profesores#, only: [:create]
  resources :perfil_admins#, except: [:create]
  mount RailsAdmin::Engine => '/basededatos', as: 'rails_admin'
  resources :publicaciones

  #devise_for :users, controllers: { registrations: 'users/registrations' }
  #devise_scope :user do
  # get '/users/sign_out' => 'devise/sessions#destroy'
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

  get '/help' => 'home#help'



  authenticated :user do
    root 'home#index'
  end
  unauthenticated :user do
  	root 'home#bienvenida' 	
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
