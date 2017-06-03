class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout
  before_action :leer_datos

  
  ##before_action :set_current_user

   #=== se abandono la idea no borrar puede ser ultil despues====
	#def set_current_user
	  #ir al controlador del profesor y alumno
	#end
  #def authenticate_admin!
  #  redirect_to root_path unless user_signed_in? && current_user.tipo.id == 1
  #end
  def solo_admin!
    redirect_to root_path if current_user.tipo.id!=1 || current_user.perfilado != true
  end
  def solo_prof!
    redirect_to root_path if current_user.tipo.id!=2 || current_user.perfilado != true
  end
  def leer_datos
    if user_signed_in?
      @tipoUser = current_user.tipo.tipo_de_usuario
      if current_user.tipo.id == 1
        unless current_user.perfil_admin.nil?
          if current_user.perfilado == true
            @nombres =  current_user.perfil_admin.nombre.capitalize
            @ap_paterno = current_user.perfil_admin.ap_paterno.capitalize
            @nombreCorto = @nombres.split(/ /)[0] + " " + @ap_paterno
            @imgPerfil = current_user.gravatar_url(default: 'mm')
            @imgCover="covers/admin-cover.jpg"
            @menuLateral=[{title:"Inicio", link:root_path, icon:"home"},{title:"Base de Datos", link:"!#", icon:"storage"},{title:"Comunicados",link:comunicados_path, icon:"description"},{title:"Publicaciones",link:publicaciones_path, icon:"account_circle"},{title:"Agregar",link:new_comunicado_path, icon:"add"}, {title:"Agregar usuario", link:new_user_registration_path, icon:"person_add"},{title:"Editar perfil", icon:"border_color"}]
            @tablas=[{title:"Panel de administración", link:rails_admin_path},{title:"Archivo", link:"basededatos/archivo"},{title:"Color", link:"basededatos/color"}, {title:"Generación", link:"basededatos/generacion"},{title:"Grado", link:"basededatos/grado"},  {title:"Grupo", link:"basededatos/grupo"},{title:"Materia", link:"basededatos/materia"}, {title:"Administrativos", link:"basededatos/perfil_admin"},{title:"Profesores", link:"basededatos/perfil_profesor"},{title:"Alumnos", link:"basededatos/perfil_alumno"}, {title:"Tutores", link:"basededatos/perfil_tutor"}, {title:"Publicación", link:"basededatos/publicacion"},{title:"Tipos", link:"basededatos/tipo"}, {title:"Turno", link:"basededatos/turno"}, {title:"Usuario", link:"basededatos/user"}]
            @tiposPerfiles=[{title:"Administradores", link:perfil_admins_path}, {title:"Profesor",link:perfil_profesores_path}, {title:"Alumnos",link:perfil_alumnos_path}, {title:"Tutores",link:perfil_tutores_path}]
            @notificationes=[{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"},{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"}]
          else
            @imgPerfil = "users/desconocido.jpeg"
            @imgCover = "covers/desconocido.jpg"
          end
        else
          @imgPerfil = "users/desconocido.jpeg"
          @imgCover = "covers/desconocido.jpg"
        end

      elsif current_user.tipo.id == 2
        unless current_user.perfil_profesor.nil?
          if current_user.perfilado == true
            @nombres =  current_user.perfil_profesor.nombre.capitalize
            @ap_paterno = current_user.perfil_profesor.ap_paterno.capitalize
            @nombreCorto = @nombres.split(/ /)[0] + " " + @ap_paterno
            @imgPerfil = current_user.gravatar_url(default: 'mm')
            @imgCover = "covers/prof-cover.jpeg"
            @menuLateral=[{title:"Inicio", link:root_path, icon:"home"},{title:"Publicaciones", link:publicaciones_path, icon:"account_circle"},{title:"Agregar",link:new_publicacion_path, icon:"add"}]
            @notificationes=[{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"},{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"}]
          else
            @imgPerfil = "users/desconocido.jpeg"
            @imgCover = "covers/desconocido.jpg"
          end
        else
          @imgPerfil = "users/desconocido.jpeg"
          @imgCover = "covers/desconocido.jpg"
        end
      elsif current_user.tipo.id == 3
        unless current_user.perfil_tutor.nil?
          if current_user.perfilado == true
            @nombres =  current_user.perfil_tutor.nombre.capitalize
            @ap_paterno = current_user.perfil_tutor.ap_paterno.capitalize
            @nombreCorto = @nombres.split(/ /)[0] + " " + @ap_paterno
            @imgPerfil = current_user.gravatar_url(default: 'mm')
            @imgCover = "covers/tutor-cover.jpeg"
            @notificationes=[{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"},{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"}]
          else
            @imgPerfil = "users/desconocido.jpeg"
            @imgCover = "covers/desconocido.jpg"
          end
        else
          @imgPerfil = "users/desconocido.jpeg"
          @imgCover = "covers/desconocido.jpg"
        end
      else
        unless current_user.perfil_alumno.nil?
          if current_user.perfilado == true
            @nombres =  current_user.perfil_alumno.nombre.capitalize
            @ap_paterno = current_user.perfil_alumno.ap_paterno.capitalize
            @nombreCorto = @nombres.split(/ /)[0] + " " + @ap_paterno
            @imgPerfil = current_user.gravatar_url(default: 'mm')
            @imgCover = "covers/student-cover.jpg"
            @notificationes=[{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"},{title:"Comunicado 1", icon:"sms", publicador: "David", desc: "Destacado el 00/00/00"}, {title:"Tarea 1", icon:"description", publicador: "Villena",  desc: "Fecha de entrega el 25/05/17"}, {title:"Comunicado 2", icon:"sms", publicador: "Clemente Cartujano", desc: "Alguna especie de preview o mensaje bastante largo que sí cabe"}]
          else
            @imgPerfil = "users/desconocido.jpeg"
            @imgCover = "covers/desconocido.jpg"
          end
        else
          @imgPerfil = "users/desconocido.jpeg"
          @imgCover = "covers/desconocido.jpg"
        end
      end
    end    
  end


  def set_layout
  	"application"
  end
  
end
