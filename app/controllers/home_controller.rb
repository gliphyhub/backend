class HomeController < ApplicationController
  def bienvenida
  end
  def index 
    if current_user.tipo.id == 1
      @perfil_admin = PerfilAdmin.new       
    else
       
    end 

  end

  def help
    
  end


  def set_layout
  	return "gliphymain" if action_name == "bienvenida"
  	super
  end
end
