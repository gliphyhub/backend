class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, only: [:new, :create, :cancel] #para que no me diga que ya estaba loggeado
  before_action :configure_sign_up_params, only: [:create]
  before_action :solo_admins_pueden_crear_usuarios! #para que solo el admin!

  def solo_admins_pueden_crear_usuarios!
    redirect_to root_path unless user_signed_in? && current_user.tipo.id==1  
  end


  # GET /resource/sign_up
   def new
    #super
    build_resource({})
    ield resource if block_given?
    respond_with resource  
    #@user = User.new
    #@user.create_perfil_admin 
    #@user.build_perfil_profesor
    #@user.build_perfil_tutor
    #@user.build_perfil_alumno

   end

  # POST /resource
   def create
  #   super
      build_resource(sign_up_params)
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end

    #   @user = User.create(configure_sign_up_params)
    # if @user.save
    #   flash[:success] = "Creado con exito"
    #   redirect_to new_user_session_path
    # else
    #   flash[:error] = "No se puedo crear el usuario"
    #   render  "devise/registrations/new"
    # end
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:tipo_id])
     # params.require(:user).permit(:tipo_id,
     #                    :password,
     #                    :password_confirmation,
     #                    :email,
     #                    perfil_admin_attributes: 
     #                        [:user_id, 
     #                         :nss, 
     #                         :ap_paterno, 
     #                         :ap_materno, 
     #                         :nombre,
     #                          :fecha_de_nacimiento, 
     #                          :genero_id, :calle, 
     #                          :numero_exterior, 
     #                          :numero_interior, 
     #                          :colonia, 
     #                          :delegacion_municipio, 
     #                          :codigo_postal, 
     #                          :telefono_casa, 
     #                          :telefono_celular, 
     #                          :telefono_recados, 
     #                          :extension_recados]) # Tus atributos de User
   end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
