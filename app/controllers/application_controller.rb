class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout

   before_action :set_current_user

	def set_current_user
	  
	end


  def set_layout
  	"application"
  end
end
