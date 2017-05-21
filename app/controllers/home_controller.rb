class HomeController < ApplicationController
  def bienvenida
  end
  def index
    @tipoUser = current_user.tipo.tipo_de_usuario
    @seccion="Inicio"
    if current_user.tipo.id == 1
      @nombres =  current_user.perfil_admin.nombre.capitalize
      @ap_paterno = current_user.perfil_admin.ap_paterno.capitalize
      @ap_materno = current_user.perfil_admin.ap_materno.capitalize
      @correo = current_user.email
      @fecha_de_nacimiento = current_user.perfil_admin.fecha_de_nacimiento
      @sexo = current_user.perfil_admin.genero.sexo
      @imgCover = "covers/admin-cover.jpg"
      @menuLateral=[{title:"Inicio", link:root_path, icon:"home"},
                    {title:"Base de Datos", link:"!#", icon:"storage"},
                    {title:"Publicaciones",link:publicaciones_path, icon:"account_circle"},
                    {title:"Agregar",link:new_publicacion_path, icon:"add"}]
      @tablas=[{title:"Panel de administración", link:rails_admin_path},
               {title:"Archivo", link:"basededatos/archivo"},
               {title:"Color", link:"basededatos/color"}, 
               {title:"Generación", link:"basededatos/generacion"}, 
               {title:"Grado", link:"basededatos/grado"}, 
               {title:"Grupo", link:"basededatos/grupo"}, 
               {title:"Materia", link:"basededatos/materia"}, 
               {title:"Administrativos", link:"basededatos/perfil_admin"}, 
               {title:"Profesores", link:"basededatos/perfil_profesor"}, 
               {title:"Alumnos", link:"basededatos/perfil_alumno"}, 
               {title:"Tutores", link:"basededatos/perfil_tutor"}, 
               {title:"Publicación", link:"basededatos/publicacion"}, 
               {title:"Tipos", link:"basededatos/tipo"},
               {title:"Turno", link:"basededatos/turno"}, 
               {title:"Usuario", link:"basededatos/user"}]
    elsif current_user.tipo.id == 2
      @nombres =  current_user.perfil_profesor.nombre.capitalize
      @ap_paterno = current_user.perfil_profesor.ap_paterno.capitalize
      @ap_materno = current_user.perfil_profesor.ap_materno.capitalize
      @correo = current_user.email
      @fecha_de_nacimiento = current_user.perfil_profesor.fecha_de_nacimiento
      @sexo = current_user.perfil_profesor.genero.sexo
      @imgCover = "covers/teacher-cover.jpg"
      @menuLateral=[{title:"Publicaciones", link:publicaciones_path, icon:"account_circle"},
                    {title:"Agregar",link:new_publicacion_path, icon:"add"}]
    elsif current_user.tipo.id == 3
      @nombres =  current_user.perfil_tutor.nombre.capitalize
      @ap_paterno = current_user.perfil_tutor.ap_paterno.capitalize
      @ap_materno = current_user.perfil_tutor.ap_materno.capitalize
      @correo = current_user.email
      @fecha_de_nacimiento = current_user.perfil_tutor.fecha_de_nacimiento
      @sexo = current_user.perfil_tutor.genero.sexo
      @imgCover = "covers/student-cover.jpg"
    else
      @nombres =  current_user.perfil_alumno.nombre.capitalize
      @ap_paterno = current_user.perfil_alumno.ap_paterno.capitalize
      @ap_materno = current_user.perfil_alumno.ap_materno.capitalize
      @correo = current_user.email
      @fecha_de_nacimiento = current_user.perfil_alumno.fecha_de_nacimiento
      @sexo = current_user.perfil_alumno.genero.sexo
      @grupo = current_user.perfil_alumno.grupo.grupo
      @imgCover = "covers/student-cover.jpg"
    end

    @nombreCorto = @nombres.split(/ /)[0] + " " + @ap_paterno

    if @sexo == "masculino"
      @imgPerfil = "users/user01.jpg"
    else
      @imgPerfil = "users/user02.jpg"
    end


  end



  def help
    @seccion = "Ayuda"
  end

  protected
  def set_layout
  	return "gliphymain" if action_name == "index"
  	super
  end
end
