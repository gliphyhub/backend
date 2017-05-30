class PublicacionesController < ApplicationController
  before_action :set_publicacion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :solo_admin!, only:[:new,:create,:destroy]


  Ruta_directorio_archivos = "public/archivos"
  # GET /publicaciones
  # GET /publicaciones.json
  def index
    @publicaciones = Publicacion.all
    @archi = Archivo.select("id, nombre, ruta, publicacion_id")
    @archivos = Dir.entries(Ruta_directorio_archivos)
    @urgentes = Publicacion.select("titulo, mensaje, fecha_de_termino").where(prioridad: true)
    # descomentar @publicaciones = Publicacion.select("titulo, mensaje, fecha_de_termino").where(prioridad: false)
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
    if params[:publicacion][:archivo]#si contiene un archivo
      archivo = params[:publicacion][:archivo]
      @nombre = archivo.original_filename
      dir = Ruta_directorio_archivos
      ext = @nombre.slice(@nombre.rindex("."), @nombre.length).downcase
      if ext == ".pdf" || ext == ".pptx" || ext == ".docx" || ext == ".xlsx"|| ext == ".ppt" || ext == ".doc" || ext == ".xls" || ext == ".rar"|| ext == ".zip"
        path = File.join(dir, @nombre)
        resultado = File.open(path, "wb") {|f| f.write(archivo.read)}
        if resultado
          subir = "ok"
          @ruta = path
          #@titulo = params[:publicacion][:titulo]
          #@mensaje = params[:publicacion][:mensaje]
          #@fecha_de_termino = params[:publicacion][:fecha_de_termino]
          #if params[:publicacion][:urgente]
          #  @publicacion = Publicacion.new({
          #  titulo: @titulo,
          #  mensaje: @mensaje,
          #  fecha_de_termino: @fecha_de_termino,
          #  prioridad: true
          #})
          #else
          #  @publicacion = Publicacion.new({
          #  titulo: @titulo,
          #  mensaje: @mensaje,
          #  fecha_de_termino: @fecha_de_termino,
          #  prioridad: false
          #})
          #end
          @publicacion = Publicacion.new(publicacion_params)
          respond_to do |format|
            if @publicacion.save()
              id = Publicacion.last.id
              @tarea = Publicacion.find(id)
              @archivo = Archivo.new({
                publicacion_id: id,
                nombre: @nombre,
                ruta: @ruta
              })
              if @archivo.save()
                format.html { redirect_to @publicacion, notice: 'La publicación ha sido creada satisfactoriamente.' }
                format.json { render :show, status: :created, location: @publicacion }
              else
                format.html { render :new }
                format.json { render json: @publicacion.errors, status: :unprocessable_entity }
              end
            else
              format.html { render :new }
              format.json { render json: @publicacion.errors, status: :unprocessable_entity }
            end
          end
        else
          subir = "No se pudo subir el archivo."
        end
      else
        @formato_erroneo = true
      end
    else
      @publicacion = Publicacion.new(publicacion_params)
      respond_to do |format|
        if @publicacion.save()
          format.html { redirect_to @publicacion, notice: 'La publicación ha sido creada satisfactoriamente.' }
          format.json { render :show, status: :created, location: @publicacion }
        else
          format.html { render :new }
          format.json { render json: @publicacion.errors, status: :unprocessable_entity }
        end
      end
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
                                          :fecha_de_termino, 
                                          :prioridad)
    end
end
