class PerfilAdminsController < ApplicationController
  before_action :set_perfil_admin, only: [:show, :edit, :update, :destroy]

  # GET /perfil_admins
  # GET /perfil_admins.json
  def index
    @perfil_admins = PerfilAdmin.all
  end

  # GET /perfil_admins/1
  # GET /perfil_admins/1.json
  def show
  end

  # GET /perfil_admins/new
  def new
    @perfil_admin = PerfilAdmin.new
  end

  # GET /perfil_admins/1/edit
  def edit
  end

  # POST /perfil_admins
  # POST /perfil_admins.json
  def create
    @perfil_admin = PerfilAdmin.new(perfil_admin_params)

    respond_to do |format|
      if @perfil_admin.save
        format.html { redirect_to @perfil_admin, notice: 'Perfil admin was successfully created.' }
        format.json { render :show, status: :created, location: @perfil_admin }
      else
        format.html { render :new }
        format.json { render json: @perfil_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfil_admins/1
  # PATCH/PUT /perfil_admins/1.json
  def update
    respond_to do |format|
      if @perfil_admin.update(perfil_admin_params)
        format.html { redirect_to @perfil_admin, notice: 'Perfil admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @perfil_admin }
      else
        format.html { render :edit }
        format.json { render json: @perfil_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfil_admins/1
  # DELETE /perfil_admins/1.json
  def destroy
    @perfil_admin.destroy
    respond_to do |format|
      format.html { redirect_to perfil_admins_url, notice: 'Perfil admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil_admin
      @perfil_admin = PerfilAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_admin_params
      params.require(:perfil_admin).permit(:user_id, :nss, :ap_paterno, :ap_materno, :nombre, :fecha_de_nacimiento, :genero_id, :calle, :numero_exterior, :numero_interior, :colonia, :delegacion_municipio, :codigo_postal, :telefono_casa, :telefono_celular, :telefono_recados, :extension_recados)
    end
end
