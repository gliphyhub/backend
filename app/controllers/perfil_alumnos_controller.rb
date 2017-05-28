class PerfilAlumnosController < ApplicationController
  #before_action :set_perfil_alumno, only: [:show, :edit, :update, :destroy]

  # GET /perfil_alumnos
  # GET /perfil_alumnos.json
  #def index
  #  @perfil_alumnos = PerfilAlumno.all
  #end

  # GET /perfil_alumnos/1
  # GET /perfil_alumnos/1.json
  #def show
  #end

  # GET /perfil_alumnos/new
  def new
    @perfil_alumno = PerfilAlumno.new
  end

  # GET /perfil_alumnos/1/edit
  #def edit
  #end

  # POST /perfil_alumnos
  # POST /perfil_alumnos.json
  def create
    @perfil_alumno = PerfilAlumno.new(perfil_alumno_params)
    @perfil_alumno.user= current_user

    respond_to do |format|
      if @perfil_alumno.save
        current_user.update(perfilado:true)
        format.html { redirect_to root_path, notice: 'Bienvenido' }
        #format.json { render :show, status: :created, location: @perfil_alumno }
      else
        format.html { render :new }
        #format.json { render json: @perfil_alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfil_alumnos/1
  # PATCH/PUT /perfil_alumnos/1.json
  # def update
  #   respond_to do |format|
  #     if @perfil_alumno.update(perfil_alumno_params)
  #       format.html { redirect_to @perfil_alumno, notice: 'Perfil alumno was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @perfil_alumno }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @perfil_alumno.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /perfil_alumnos/1
  # # DELETE /perfil_alumnos/1.json
  # def destroy
  #   @perfil_alumno.destroy
  #   respond_to do |format|
  #     format.html { redirect_to perfil_alumnos_url, notice: 'Perfil alumno was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_perfil_alumno
    #  @perfil_alumno = PerfilAlumno.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_alumno_params
      params.require(:perfil_alumno).permit(:matricula, 
                                            :ap_paterno, 
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
                                            :extension_recados, 
                                            :grupo_id, 
                                            :generacion_id, 
                                            :perfil_tutor_id)
    end
end
