class HomeController < ApplicationController
  def bienvenida
  end

  def index
    @seccion="Inicio"
    if current_user.tipo.id == 1 && current_user.perfil_admin.nil?
      @perfil_admin = PerfilAdmin.new
    elsif current_user.tipo.id == 2 && current_user.perfil_profesor.nil?
      @perfil_profesor = PerfilProfesor.new
    elsif current_user.tipo.id == 3 && current_user.perfil_tutor.nil?
      @perfil_tutor = PerfilTutor.new
    elsif current_user.tipo.id == 4 && current_user.perfil_alumno.nil?
      @perfil_alumno = PerfilAlumno.new
    end
  end


  def help
    @seccion="Ayuda"
  end


  def set_layout
  	return "gliphymain" if action_name == "bienvenida"
  	super
  end
  private
    def insertar_grupos
      grupos = params[:grupos]#recibimos los grupos en un arreglo
      publicacion_id = params[:publicacion_id]#recibimos el id de la publicacion (debe existir)
      publicacion = Publicacion.find(publicacion_id)#buscamos la publicación con su id
      grupos.each do |w|#empezamos a llenar los registros una por una
        id = Grupo.select("id").where(grupo: w)#obtenemos el id del grupo
        grupo = Grupo.find(id)#buscamos el grupo con su id
        nuevo = PublicacionGrupo.new({
          grupo: grupo,
          publicacion: publicacion
        })#creamos el registro
        if nuevo.save()
          #procesos que siguen despues de guardados
        else
          #procesos que siguen si no se guardaron
        end
      end
    end
    #Cargar las publicaciones
    #######Para el controlador########
    #def 
      #@archi = Archivo.select("id, nombre, ruta, publicacion_id")
      #@archivos = Dir.entries(Ruta_directorio_archivos)
      #@urgentes = Publicacion.select("titulo, mensaje, fecha_de_termino").where(prioridad: true, condicion de que la fecha actual sea menor a la de termino)
      #@publicaciones = Publicacion.select("titulo, mensaje, fecha_de_termino").where(prioridad: false, condicion de que la fecha actual sea menor a la de termino)
    #end
    #######Para el haml#########
    #-@urgentes.each do |w|
      #%li
        #%h3
          #= w.titulo
        #%p
          #- @archi.each do |m| 
            #- if m.publicacion_id == w.id
              #- @archivos.each do |a| 
                #-if a == m.nombre
                  #- if m == "." || m == ".." then next end
                  #%strong=a
                  #%br
                  #%a{:target => "_blank", :href => "ruta_del_archivo/#{a}"}
                    #Descargar archivo
                  #%br
    #-@publicaciones.each do |w|
      #%li
        #%h3
          #= w.titulo
        #%p
          #- @archi.each do |m| 
            #- if m.publicacion_id == w.id
              #- @archivos.each do |a| 
                #-if a == m.nombre
                  #- if m == "." || m == ".." then next end
                  #%strong=a
                  #%br
                  #%a{:target => "_blank", :href => "ruta_del_archivo/#{a}"}
                    #Descargar archivo
                  #%br
end
