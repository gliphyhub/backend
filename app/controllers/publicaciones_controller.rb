class PublicacionesController < ApplicationController
  before_action :set_publicacion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :solo_prof!, only:[:new,:create,:destroy]


  Ruta_directorio_archivos = "public/prof/archivos"
  # GET /publicaciones
  # GET /publicaciones.json
  def index 
    @archi = Archivo.select("id, nombre, ruta, publicacion_id")
    @archivos = Dir.entries(Ruta_directorio_archivos)
    @urgentes = Publicacion.where(perfil_profesor_id: current_user.perfil_profesor.id, prioridad: true).reverse
    @publicaciones = Publicacion.where(perfil_profesor_id: current_user.perfil_profesor.id, prioridad:false).reverse
  end

  # GET /publicaciones/1
  # GET /publicaciones/1.json
  def show
  end

  # GET /publicaciones/new
  def new
    @publicacion = Publicacion.new
  end

  # GET /publicaciones/1/edit
  #def edit
  #end

  # POST /publicaciones
  # POST /publicaciones.json
  def create
    @seccion ="Nueva Publicacion"
    @publicacion = Publicacion.new(publicacion_params)
    #raise @publicacion
    @publicacion.perfil_profesor_id= current_user.perfil_profesor.id
    @grupos=params[:grupos]
    @materia=params[:materia_para_la_publicacion]
    unless @materia.nil?     
      unless @grupos.nil?
        @grupos.each do |id, g|
            if Materia.find(@materia).grupos.exists?(id)
              @publicacion.materia_id= @materia
              if params[:publicacion][:archivo]#si contiene un archivo
                archivo = params[:publicacion][:archivo]
                @nombre = archivo.original_filename
                dir = Ruta_directorio_archivos
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
                    respond_to do |format|
                      if @publicacion.save()
                        @grupos.each do |grupo, valor|
                          PublicacionGrupo.create(grupo_id: valor,publicacion_id:  @publicacion.id)
                        end   
                        @archivo = Archivo.new({
                          publicacion_id: @publicacion.id,
                          nombre: @nombre,
                          ruta: path
                        })
                        if @archivo.save()
                           return redirect_to publicaciones_path, notice: 'La publicación ha sido creada satisfactoriamente.' 
                          #format.json { render :show, status: :created, location: @publicacion }
                        else
                           return  render :new 
                          #format.json { render json: @publicacion.errors, status: :unprocessable_entity }
                        end
                      else
                        return render :new
                        #format.json { render json: @publicacion.errors, status: :unprocessable_entity }
                      end
                    end
                  else
                    flash[:error] = "No se pudo subir el archivo"
                    render:new
                  end
                else
                  flash[:error] = "El formato ingresado es incorrecto. Solo puedes subir archivos .doc, .docx, .pdf, .xlsx, .pptx, .ppt, .xls, .png, .gif, .jpg, .jpeg, .rar, .zip"
                  render :new 
                end
              else#si no tiene archivo
                respond_to do |format|
                  if @publicacion.save()
                    @grupos.each do |grupo, valor|
                      PublicacionGrupo.create(grupo_id: valor,publicacion_id:  @publicacion.id)
                    end   
                    return redirect_to publicaciones_path, notice: 'La publicación ha sido creada satisfactoriamente.' 
                    #format.json { render :show, status: :created, location: @publicacion }
                  else
                    return render:new
                    #format.json { render json: @publicacion.errors, status: :unprocessable_entity }
                  end
                end
              end
            else
              flash[:error] = "El grupo y la materia debe coincidir"
              return render:new
            end
        end
      else
        flash[:error] = "Debes seleccionar almenos un grupo"
        render:new
      end
    else
      flash[:error] = "Debes seleccionar una materia"
      render:new
    end

  end
  # PATCH/PUT /publicaciones/1
  # PATCH/PUT /publicaciones/1.json
  #def update
  #  respond_to do |format|
  #    if @publicacion.update(publicacion_params)
  #      format.html { redirect_to @publicacion, notice: 'Publicacion was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @publicacion }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @publicacion.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /publicaciones/1
  # DELETE /publicaciones/1.json
  def destroy
    @publicacion.destroy
    respond_to do |format|
      format.html { redirect_to publicaciones_url, notice: 'Publicacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicacion
      @publicacion = Publicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicacion_params
      params.require(:publicacion).permit(:titulo, 
                                          :mensaje,
                                          :mensaje_markdown,
                                          :fecha_de_termino, 
                                          :prioridad,
                                          :grupos,
                                          :materia_para_la_publicacion)
    end
end
