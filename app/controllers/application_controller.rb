class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout

   before_action :set_current_user

   #=== se abandono la idea no borrar puede ser ultil despues====
	def set_current_user
	  #ir al controlador del profesor y alumno
	end


  def set_layout
  	"application"
  end
  
end
