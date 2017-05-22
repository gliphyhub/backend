class HomeController < ApplicationController
  def bienvenida
  end
  def index   

  end



  def help
    
  end


  def set_layout
  	return "gliphymain" if action_name == "bienvenida"
  	super
  end
end
