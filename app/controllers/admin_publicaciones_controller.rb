class AdminPublicacionesController < ApplicationController
  before_action :set_admin_publicacion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :solo_admin!, only:[:new,:create,:destroy]


  Ruta_directorio_archivos = "public/admin/archivos"

  # GET /admin_publicaciones
  # GET /admin_publicaciones.json
  def index
    @admin_publicaciones = AdminPublicacion.all
    #@archi = AdminArchivo.select("id, nombre, ruta, publicacion_id")
    #@archivos = Dir.entries(Ruta_directorio_archivos)
    #@urgentes = Publicacion.select("titulo, mensaje, fecha_de_termino").where(prioridad: true)
  end

  # GET /admin_publicaciones/1
  # GET /admin_publicaciones/1.json
  def show
  end

  # GET /admin_publicaciones/new
  def new
    @admin_publicacion = AdminPublicacion.new
  end

  # GET /admin_publicaciones/1/edit
  def edit
  end

  # POST /admin_publicaciones
  # POST /admin_publicaciones.json
  def create
    @admin_publicacion = AdminPublicacion.new(admin_publicacion_params)
    @admin_publicacion.perfil_admin_id= current_user.perfil_admin.id
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
            if @admin_publicacion.save()
              @archivo = AdminArchivo.new({
                publicacion_id: @admin_publicacion.id,
                nombre: @nombre,
                ruta: path
              })
              if @archivo.save()
                format.html { redirect_to publicaciones_path, notice: 'La publicación ha sido creada satisfactoriamente.' }
                #format.json { render :show, status: :created, location: @admin_publicacion }
              else
                format.html { render :new }
                #format.json { render json: @admin_publicacion.errors, status: :unprocessable_entity }
              end
            else
              format.html { render :new }
              #format.json { render json: @admin_publicacion.errors, status: :unprocessable_entity }
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
    else
      respond_to do |format|
        if @admin_publicacion.save()
          format.html { redirect_to publicaciones_path, notice: 'La publicación ha sido creada satisfactoriamente.' }
          format.json { render :show, status: :created, location: @admin_publicacion }
        else
          format.html { render :new }
          #format.json { render json: @admin_publicacion.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /admin_publicaciones/1
  # PATCH/PUT /admin_publicaciones/1.json
  def update
    respond_to do |format|
      if @admin_publicacion.update(admin_publicacion_params)
        format.html { redirect_to @admin_publicacion, notice: 'Admin publicacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_publicacion }
      else
        format.html { render :edit }
        format.json { render json: @admin_publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_publicaciones/1
  # DELETE /admin_publicaciones/1.json
  def destroy
    @admin_publicacion.destroy
    respond_to do |format|
      format.html { redirect_to admin_publicaciones_url, notice: 'Admin publicacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_publicacion
      @admin_publicacion = AdminPublicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_publicacion_params
      params.require(:admin_publicacion).permit(:titulo,
                                                :mensaje,
                                                :mensaje_markdown,
                                                :fecha_de_termino,
                                                :prioridad,
                                                :perfil_admin_id)
    end
end
