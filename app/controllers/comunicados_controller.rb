class ComunicadosController < ApplicationController
  before_action :set_comunicado, only: [:destroy,:visitar]
  before_action :authenticate_user!
  before_action :solo_admin!, only:[:new,:create,:destroy]

  Ruta_directorio_archivos = "public/prof/archivos"

   def visitar
    @comunicado.update(visitas: @comunicado.visitas + 1)

   end

  # GET /comunicados
  # GET /comunicados.json
  def index
    @seccion = "Comunicados"
    if current_user.tipo.id == 1
      @comunicados = Comunicado.paginate(:page => params[:page], :per_page => 9).order('prioridad DESC, created_at DESC')
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
    @tipos=params[:tipos]
    @niveles=params[:niveles]
    @turnos=params[:turnos]
    @grupos=params[:grupos] # vienen en array
    @grados=params[:grados]
    @gradoturno=params[:gradoturno]#viene en array
    #sraise @comunicado
    if @tipos.nil? && @niveles.nil?
      #los dos vacios comprobado
      if @turnos.nil?
        #los 3 vacios comprobado
        if @grupos.nil?
          #grupos vacio comprobado
          if @grados.nil?
             #grados esta nulo 
             #todo vacio no tiene caso ver si los @gradoturno tiene algo
          else
            #grados seleccionado
            if @gradoturno.nil?
              #no hay filtros de matutino o vespertino 
            else
              #hay filtros de turno
              #====AQUI SE GUARDA==========
            end
          end
        else
          # hay grupos seleccionados
          #====AQUI SE GUARDA==========
        end
      else
        # pues si solo son dos vacios
      end
    else # de tipos y niveles
      #tipo o nivel tiene algo
      if @niveles.nil?
        flash[:error] = "nivel es el vacio"
        render:new
      elsif @tipos.nil?
        flash[:error] = "tipos es el vacio"
        render:new
      else
        #llenos los dos comprobados
        if @turnos.nil?
          flash[:error] = "turnos el vacio"
          render:new
        else
          #llenos los 3 comprobado
          #====AQUI SE GUARDA==========
        end
      end
    end # de tipos y niveles

    # respond_to do |format|
    #   if @comunicado.save
    #     format.html { redirect_to @comunicado, notice: 'Comunicado fue creado satisfactoriamente' }
    #   else
    #     return render :new        
    #   end # end del save
    # end #end del do format antes del save
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
      format.html { redirect_to comunicados_url, notice: 'Comunicado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comunicado
      @comunicado = Comunicado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comunicado_params
      params.require(:comunicado).permit(:titulo, 
                                         :mensaje,
                                         :mensaje_markdown, 
                                         :fecha_de_termino, 
                                         :prioridad)
    end
end
