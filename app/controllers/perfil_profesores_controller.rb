class PerfilProfesoresController < ApplicationController
  before_action :set_perfil_profesor, only: [:show, :edit, :update, :destroy]

  # GET /perfil_profesores
  # GET /perfil_profesores.json
  def index
    @perfil_profesores = PerfilProfesor.all
  end

  # GET /perfil_profesores/1
  # GET /perfil_profesores/1.json
  def show
  end

  # GET /perfil_profesores/new
  def new
    @perfil_profesor = PerfilProfesor.new
  end

  # GET /perfil_profesores/1/edit
  def edit
  end

  # POST /perfil_profesores
  # POST /perfil_profesores.json
  def create
    @perfil_profesor = PerfilProfesor.new(perfil_profesor_params)

    respond_to do |format|
      if @perfil_profesor.save
        format.html { redirect_to @perfil_profesor, notice: 'Perfil profesor was successfully created.' }
        format.json { render :show, status: :created, location: @perfil_profesor }
      else
        format.html { render :new }
        format.json { render json: @perfil_profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfil_profesores/1
  # PATCH/PUT /perfil_profesores/1.json
  def update
    respond_to do |format|
      if @perfil_profesor.update(perfil_profesor_params)
        format.html { redirect_to @perfil_profesor, notice: 'Perfil profesor was successfully updated.' }
        format.json { render :show, status: :ok, location: @perfil_profesor }
      else
        format.html { render :edit }
        format.json { render json: @perfil_profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfil_profesores/1
  # DELETE /perfil_profesores/1.json
  def destroy
    @perfil_profesor.destroy
    respond_to do |format|
      format.html { redirect_to perfil_profesores_url, notice: 'Perfil profesor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil_profesor
      @perfil_profesor = PerfilProfesor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_profesor_params
      params.require(:perfil_profesor).permit(:user_id, :nss, :ap_paterno, :ap_materno, :nombre, :fecha_de_nacimiento, :genero_id, :calle, :numero_exterior, :numero_interior, :colonia, :delegacion_municipio, :codigo_postal, :telefono_casa, :telefono_celular, :telefono_recados, :extension_recados)
    end
end
