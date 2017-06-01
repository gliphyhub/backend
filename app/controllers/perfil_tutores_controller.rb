class PerfilTutoresController < ApplicationController
  before_action :set_perfil_tutor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :solo_admin!, only:[:index,:show,:update,:destroy]

  # GET /perfil_tutores
  # GET /perfil_tutores.json
  def index
   @perfil_tutores = PerfilTutor.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /perfil_tutores/1
  # GET /perfil_tutores/1.json
  def show
  end

  # GET /perfil_tutores/new
  #def new
  #  @perfil_tutor = PerfilTutor.new
  #end

  # GET /perfil_tutores/1/edit
  #def edit
  #end

  # POST /perfil_tutores
  # POST /perfil_tutores.json
  def create
    @perfil_tutor = PerfilTutor.new(perfil_tutor_params)
    @perfil_tutor.user= current_user
    respond_to do |format|
      if @perfil_tutor.save
        current_user.update(perfilado:true)
        format.html { redirect_to root_path, notice: '¡Bienvenido! Ya puedes disfrutar de tu cuenta' }
        #format.json { render :show, status: :created, location: @perfil_tutor }
      else
        format.html { render :new }
        #format.json { render json: @perfil_tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfil_tutores/1
  # PATCH/PUT /perfil_tutores/1.json
  def update
    respond_to do |format|
      if @perfil_tutor.update(perfil_tutor_params)
        format.html { redirect_to @perfil_tutor, notice: 'Perfil tutor se actualizó correctamente' }
        #format.json { render :show, status: :ok, location: @perfil_tutor }
      else
        format.html { render :edit }
        #format.json { render json: @perfil_tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfil_tutores/1
  # DELETE /perfil_tutores/1.json
  def destroy
    @perfil_tutor.destroy
    @perfil_tutor.user.update(perfilado:false)
    respond_to do |format|
      format.html { redirect_to perfil_tutores_url, notice: 'Perfil fue eliminado correctamente' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil_tutor
      @perfil_tutor = PerfilTutor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_tutor_params
      params.require(:perfil_tutor).permit(:ap_paterno, 
                                           :ap_materno, 
                                           :nombre, 
                                           :fecha_de_nacimiento, 
                                           :genero_id, 
                                           :calle, 
                                           :numero_exterior, 
                                           :numero_interior, 
                                           :colonia, 
                                           :delegacion_municipio, 
                                           :codigo_postal, 
                                           :telefono_casa, 
                                           :telefono_celular, 
                                           :telefono_recados, 
                                           :extension_recados)
    end
end
