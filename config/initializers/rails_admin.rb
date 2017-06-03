RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.tipo.id == 1
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.excluded_models = ["MateriaGrupo","ProfesorGrupo","ProfesorMateria"]
  #nivel
  # config.model Nivel do
  # configure :nivel do
  # read_only true
  # end
  # configure :grupos do
  # read_only true
  # end
  # configure :materias do
  # read_only true
  # end
  # end
  # #genero
  # config.model Genero do
  # configure :sexo do
  # read_only true
  # end
  # configure :perfil_admins do
  # read_only true
  # end
  # configure :perfil_profesores do
  # read_only true
  # end
  # configure :perfil_tutores do
  # read_only true
  # end
  # configure :perfil_alumnos do
  # read_only true
  # end
  # end
  # #generacion
  # config.model Generacion do
  # configure :perfil_alumnos do
  # read_only true
  # end
  # end
  # config.model 'Generacion' do
  #   edit do
  #     group :default do
  #       label "Generacion"
  #       help "Agregar una descripción para asignar posteriormente"
  #     end
  #   end
  # end
  # #grado
  # config.model Grado do
  # configure :grado do
  # read_only true
  # end
  # configure :materias do
  # read_only true
  # end
  # configure :grupos do
  # read_only true
  # end
  # end
  # #grupo
  # config.model Grupo do
  # configure :publicacion_grupos do
  # read_only true
  # end
  # configure :perfil_profesores do
  # read_only true
  # end
  # configure :perfil_alumnos do
  # read_only true
  # end
  # configure :publicaciones do
  # read_only true
  # end
  # configure :comunicados do
  # read_only true
  # end
  # configure :comunicado_grupos do
  # read_only true
  # end
  # end
  # #materias
  # config.model Materia do
  # configure :perfil_profesores do
  # read_only true
  # end
  # configure :publicaciones do
  # read_only true
  # end
  # end

  # #perfil admin
  # config.model PerfilAdmin do
  # configure :admin_publicaciones do
  # read_only true
  # end
  # end
  # #perfil profesor
  # config.model PerfilProfesor do
  # configure :grupos do
  # read_only true
  # end
  # configure :materias do
  # read_only true
  # end
  # configure :publicaciones do
  # read_only true
  # end
  # end
  # #tipo
  # config.model Tipo do
  # configure :users do
  # read_only true
  # end
  # end
  # #turno
  # config.model Turno do
  # configure :turno do
  # read_only true
  # end
  # configure :grupos do
  # read_only true
  # end
  # end
  #user
  config.model User do
  configure :perfilado do
  read_only true
  end
  configure :email do
  read_only true
  end
  configure :password  do
  read_only true
  end
  configure :encrypted_password  do
  read_only true
  end
  configure :password_confirmation do
  read_only true
  end
  configure :reset_password_token  do
  read_only true
  end
  configure :reset_password_sent_at do
  read_only true
  end
  configure :remember_created_at  do
  read_only true
  end
  configure :sign_in_count do
  read_only true
  end
  configure :current_sign_in_at do
  read_only true
  end
  configure :last_sign_in_at  do
  read_only true
  end
  configure :current_sign_in_ip  do
  read_only true
  end
  configure :last_sign_in_ip do
  read_only true
  end
  end

end
