class ComunicadosController < ApplicationController
  before_action :set_comunicado, only: [:destroy,:visitar,:fijar]
  before_action :authenticate_user!
  before_action :solo_admin!, only:[:new,:create,:destroy,:fijar]
  before_action :solo_perfilados

  Ruta_directorio_archivos_admin = "public/admin/archivos"

   def visitar
    @comunicado.update(visitas: @comunicado.visitas + 1)
   end
   def fijar
    if @comunicado.prioridad == true
      @comunicado.update(prioridad: false)
    else
      @comunicado.update(prioridad: true)
    end
    return redirect_to comunicados_path
   end

  # GET /comunicados
  # GET /comunicados.json
  def index
    @seccion = "Comunicados"
    #==================0cambiar tamebin en el home controler=======================
    @archi_c = ComunicadoArchivo.select("id, nombre, ruta, comunicado_id")
    #==================0cambiar tamebin en el home controler=======================
    @archivos_c = Dir.entries(Ruta_directorio_archivos_admin)
    if current_user.tipo.id == 1
      @comunicados = Comunicado.paginate(:page => params[:page], :per_page => 9).order('prioridad DESC, created_at DESC')
    elsif current_user.tipo.id == 2
      if current_user.perfilado == true
        @comunicados = current_user.perfil_profesor.comunicados.paginate(:page => params[:page], :per_page => 9).order('prioridad DESC, created_at DESC')
      else
        @comunicados = Comunicado.paginate(:page => params[:page], :per_page => 9).order('prioridad DESC, created_at DESC')
      end
    end
  end

  # GET /comunicados/1
  # GET /comunicados/1.json
  #def show
  #end

  # GET /comunicados/new
  def new
    @seccion = "Nueva publicación"
    @comunicado = Comunicado.new
  end

  # GET /comunicados/1/edit
  #def edit
  #end

  # POST /comunicados
  # POST /comunicados.json
  def create
    @comunicado = Comunicado.new(comunicado_params)
    @comunicado.perfil_admin_id = current_user.perfil_admin.id
    @comunicado.prioridad = false
    #filtro todo
    @tipos=params[:tipos]
    @niveles=params[:niveles]
    @turnos=params[:turnos]
    #filtro general
    @grupos=params[:grupos] # vienen en array
    @grados=params[:grados]
    @gradoturno=params[:gradoturno]#viene en array
    #raise @comunicado
    if @tipos.nil? && @niveles.nil?
      #los dos vacios comprobado
      if @turnos.nil?
        #los 3 vacios comprobado
        if @grupos.nil?
          #grupos vacio comprobado
          if @grados.nil?
             #grados esta nulo 
             #todo vacio no tiene caso ver si los @gradoturno tiene algo
             flash[:error] = "Por favor seleccione algun filtro"
             render:new
          else
            #grados seleccionado para enviar algo
            if @gradoturno.nil?
              #no hay filtros de matutino o vespertino 
              flash[:error] = "Para enviar a grados seleccione también el turno"
              return render:new
            else
              #hay filtros de turno y grados
              if params[:comunicado][:comunicado_archivo]#si contiene un archivo
                archivo = params[:comunicado][:comunicado_archivo]
                @nombre = archivo.original_filename
                dir = Ruta_directorio_archivos_admin
                ext = @nombre.slice(@nombre.rindex("."), @nombre.length).downcase
                if ext == ".pdf" || 
                   ext == ".pptx" || 
                   ext == ".docx" || 
                   ext == ".xlsx"|| 
                   ext == ".ppt" || 
                   ext == ".doc" || 
                   ext == ".xls" ||
                   ext == ".png" ||
                   ext == ".jpg" ||
                   ext == ".jpeg" ||
                   ext == ".gif" ||
                   ext == ".rar"|| 
                   ext == ".zip"
                  path = File.join(dir, @nombre)
                  resultado = File.open(path, "wb") {|f| f.write(archivo.read)}
                  if resultado
                      if @comunicado.save
                        @grados.each do |gradoespecifico|
                          @gradoturno.each do |gturn|
                            Grupo.where(grado_id:gradoespecifico.to_i,turno_id:gturn.to_i).each do |ggesp|
                              ComunicadoGrupo.create(grupo_id:ggesp.id,comunicado_id:@comunicado.id)
                            end
                          end                  
                        end
                        @archivo_comunicado = ComunicadoArchivo.new({
                          comunicado_id: @comunicado.id,
                          nombre: @nombre,
                          ruta: path
                        })
                        if @archivo_comunicado.save()
                           return redirect_to comunicados_path, notice: 'La publicación ha sido creada satisfactoriamente.'         
                        else
                           return  render :new         
                        end
                      else #del save
                        return render :new      
                      end #del save
                  else
                    flash[:error] = "No se pudo subir el archivo"
                    render:new
                  end
                else
                  flash[:error] = "El formato ingresado es incorrecto. Solo puedes subir archivos .doc, .docx, .pdf, .xlsx, .pptx, .ppt, .xls, .png, .gif, .jpg, .jpeg, .rar, .zip"
                  render :new 
                end
              else # si no tiene archvo              
              #====AQUI SE GUARDA==========
                if @comunicado.save
                  @grados.each do |gradoespecifico|
                    @gradoturno.each do |gturn|
                      Grupo.where(grado_id:gradoespecifico.to_i,turno_id:gturn.to_i).each do |ggesp|
                        ComunicadoGrupo.create(grupo_id:ggesp.id,comunicado_id:@comunicado.id)
                      end
                    end                  
                  end
                  redirect_to comunicados_path, notice: 'Comunicado fue creado satisfactoriamente'
                else #del save
                  return render:new
                end #del save
              end #si archivo
            end # grupos nilos
          end
        else
          if params[:comunicado][:comunicado_archivo]#si contiene un archivo
            archivo = params[:comunicado][:comunicado_archivo]
            @nombre = archivo.original_filename
            dir = Ruta_directorio_archivos_admin
            ext = @nombre.slice(@nombre.rindex("."), @nombre.length).downcase
            if ext == ".pdf" || 
               ext == ".pptx" || 
               ext == ".docx" || 
               ext == ".xlsx"|| 
               ext == ".ppt" || 
               ext == ".doc" || 
               ext == ".xls" ||
               ext == ".png" ||
               ext == ".jpg" ||
               ext == ".jpeg" ||
               ext == ".gif" ||
               ext == ".rar"|| 
               ext == ".zip"
              path = File.join(dir, @nombre)
              resultado = File.open(path, "wb") {|f| f.write(archivo.read)}
              if resultado
                  if @comunicado.save
                    @grupos.each do |grupoespecifico|
                      ComunicadoGrupo.create(grupo_id:grupoespecifico.to_i,comunicado_id: @comunicado.id)
                    end
                    @archivo_comunicado = ComunicadoArchivo.new({
                      comunicado_id: @comunicado.id,
                      nombre: @nombre,
                      ruta: path
                    })
                    if @archivo_comunicado.save()
                       return redirect_to comunicados_path, notice: 'La publicación ha sido creada satisfactoriamente.'         
                    else
                       return  render :new         
                    end
                  else #del save
                    return render :new      
                  end #del save
              else
                flash[:error] = "No se pudo subir el archivo"
                render:new
              end
            else
              flash[:error] = "El formato ingresado es incorrecto. Solo puedes subir archivos .doc, .docx, .pdf, .xlsx, .pptx, .ppt, .xls, .png, .gif, .jpg, .jpeg, .rar, .zip"
              render :new 
            end
          else # si no tiene archvo
            # hay grupos seleccionados asi en epecifico
            #====AQUI SE GUARDA==========
            if @comunicado.save
              @grupos.each do |grupoespecifico|
                ComunicadoGrupo.create(grupo_id:grupoespecifico.to_i,comunicado_id: @comunicado.id)
              end
              redirect_to comunicados_path, notice: 'Comunicado fue creado satisfactoriamente'
            else
              return render :new
            end
          end
        end
      else
        #pues si solo dos vacios
        flash[:error] = "Si desea utilizar el filtro TODO llene los demas campos"
        return render:new
      end
    else # de tipos y niveles
      #tipo o nivel tiene algo
      if @niveles.nil?
        flash[:error] = "Nivel no debe estar vacio"
        render:new
      elsif @tipos.nil?
        flash[:error] = "Usuarios no debe estar vacio"
        render:new
      else
        #llenos los dos comprobados
        if @turnos.nil?
          flash[:error] = "Turnos no puede estar vacio"
          render:new
        else
          if params[:comunicado][:comunicado_archivo]#si contiene un archivo
            archivo = params[:comunicado][:comunicado_archivo]
            @nombre = archivo.original_filename
            dir = Ruta_directorio_archivos_admin
            ext = @nombre.slice(@nombre.rindex("."), @nombre.length).downcase
            if ext == ".pdf" || 
               ext == ".pptx" || 
               ext == ".docx" || 
               ext == ".xlsx"|| 
               ext == ".ppt" || 
               ext == ".doc" || 
               ext == ".xls" ||
               ext == ".png" ||
               ext == ".jpg" ||
               ext == ".jpeg" ||
               ext == ".gif" ||
               ext == ".rar"|| 
               ext == ".zip"
              path = File.join(dir, @nombre)
              resultado = File.open(path, "wb") {|f| f.write(archivo.read)}
              if resultado
                  if @comunicado.save
                      @tipos.each do |tipo, key|
                      if key.to_i == 2 #prof
                        PerfilProfesor.all.each do |p|
                          @niveles.each do |nivel, koy|
                            @turnos.each do |turno, kiy|
                              if p.grupos.where(nivel_id:koy.to_i,turno_id:kiy.to_i).size != 0
                                a = ComunicadoProfesor.where(perfil_profesor_id:p.id,comunicado_id:@comunicado.id).size
                                if a == 0
                                  ComunicadoProfesor.create(perfil_profesor_id:p.id,comunicado_id:@comunicado.id)
                                end
                              end
                            end
                          end
                        end
                      elsif key.to_i == 3 #tutor
                        PerfilTutor.all.each do |t|
                          if t.perfil_alumnos.size !=0
                            t.perfil_alumnos.each do |at|
                              @turnos.each do |turnos, kiyo|                    
                                @niveles.each do |niveles, koyo|                         
                                  if at.grupo.nivel.id == koyo.to_i && at.grupo.turno.id == kiyo.to_i
                                    b = ComunicadoTutor.where(perfil_tutor_id:t.id,comunicado_id:@comunicado.id).size
                                    if b  == 0
                                       ComunicadoTutor.create(perfil_tutor_id:t.id,comunicado_id:@comunicado.id)
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      else #alumno
                        Grado.all.each do |grade|
                          @niveles.each do |level, kiya|
                            @turnos.each do |turn, koya|
                              grade.grupos.where(nivel_id:kiya.to_i,turno_id:koya.to_i).each do |gg|
                                ComunicadoGrupo.create(grupo_id:gg.id,comunicado_id:@comunicado.id)
                              end
                            end
                          end
                        end
                      end
                    end
                    @archivo_comunicado = ComunicadoArchivo.new({
                      comunicado_id: @comunicado.id,
                      nombre: @nombre,
                      ruta: path
                    })
                    if @archivo_comunicado.save()
                       return redirect_to comunicados_path, notice: 'La publicación ha sido creada satisfactoriamente.'         
                    else
                       return  render :new
                    end
                  else #del save
                    return render :new      
                  end #del save
              else
                flash[:error] = "No se pudo subir el archivo"
                render:new
              end
            else
              flash[:error] = "El formato ingresado es incorrecto. Solo puedes subir archivos .doc, .docx, .pdf, .xlsx, .pptx, .ppt, .xls, .png, .gif, .jpg, .jpeg, .rar, .zip"
              render :new 
            end
          else # si no tiene archvo  
          #llenos los 3 comprobado
          #====AQUI SE GUARDA==========     
              if @comunicado.save
                    @tipos.each do |tipo, key|
                    if key.to_i == 2 #prof
                      PerfilProfesor.all.each do |p|
                        @niveles.each do |nivel, koy|
                          @turnos.each do |turno, kiy|
                            if p.grupos.where(nivel_id:koy.to_i,turno_id:kiy.to_i).size != 0
                              a = ComunicadoProfesor.where(perfil_profesor_id:p.id,comunicado_id:@comunicado.id).size
                              if a == 0
                                ComunicadoProfesor.create(perfil_profesor_id:p.id,comunicado_id:@comunicado.id)
                              end
                            end
                          end
                        end
                      end
                    elsif key.to_i == 3 #tutor
                      PerfilTutor.all.each do |t|
                        if t.perfil_alumnos.size !=0
                          t.perfil_alumnos.each do |at|
                            @turnos.each do |turnos, kiyo|                    
                              @niveles.each do |niveles, koyo|                         
                                if at.grupo.nivel.id == koyo.to_i && at.grupo.turno.id == kiyo.to_i
                                  b = ComunicadoTutor.where(perfil_tutor_id:t.id,comunicado_id:@comunicado.id).size
                                  if b  == 0
                                     ComunicadoTutor.create(perfil_tutor_id:t.id,comunicado_id:@comunicado.id)
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    else #alumno
                      Grado.all.each do |grade|
                        @niveles.each do |level, kiya|
                          @turnos.each do |turn, koya|
                            grade.grupos.where(nivel_id:kiya.to_i,turno_id:koya.to_i).each do |gg|
                              ComunicadoGrupo.create(grupo_id:gg.id,comunicado_id:@comunicado.id)
                            end
                          end
                        end
                      end
                    end
                  end
                  redirect_to comunicados_path, notice: 'Comunicado fue creado satisfactoriamente' 
              else #else del save
                 return render :new
              end # end del save
          end
        end
      end
    end # de tipos y niveles

  end

  # PATCH/PUT /comunicados/1
  # PATCH/PUT /comunicados/1.json
  # def update
  #   respond_to do |format|
  #     if @comunicado.update(comunicado_params)
  #       format.html { redirect_to @comunicado, notice: 'Comunicado was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @comunicado }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comunicado.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comunicados/1
  # DELETE /comunicados/1.json
  def destroy
    @comunicado.destroy
    respond_to do |format|
      format.html { redirect_to comunicados_url, notice: 'Comunicado fue eliminado correctamente' }
    end
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_comunicado
      @comunicado = Comunicado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comunicado_params
      params.require(:comunicado).permit(:titulo, 
                                         :mensaje,
                                         :mensaje_markdown)
    end
end