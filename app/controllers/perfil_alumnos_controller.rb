class PerfilAlumnosController < ApplicationController
  before_action :set_perfil_alumno, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :solo_admin!, only:[:index,:show,:update,:destroy]

  # GET /perfil_alumnos
  # GET /perfil_alumnos.json
  def index
    @seccion="Perfiles Alumnos"
    @perfil_alumnos = PerfilAlumno.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  # GET /perfil_alumnos/1
  # GET /perfil_alumnos/1.json
  def show
    @seccion="Perfil Alumno"
  end

  # GET /perfil_alumnos/new
  #def new
  #  @perfil_alumno = PerfilAlumno.new
  #end

  # GET /perfil_alumnos/1/edit
  #def edit
  #end

  # POST /perfil_alumnos
  # POST /perfil_alumnos.json
  def create
    @perfil_alumno = PerfilAlumno.new(perfil_alumno_params)
    @perfil_alumno.user= current_user
    @tutor_pertenece=  User.find_by("email = ?",params[:tutor_mailcito])
    unless @tutor_pertenece.nil?
      if @tutor_pertenece.tipo.id == 3
        @perfil_alumno.perfil_tutor_id=@tutor_pertenece.perfil_tutor.id
        respond_to do |format|
          if @perfil_alumno.save
            current_user.update(perfilado:true)
            format.html { redirect_to root_path, notice:  '¡Bienvenido! Ya puedes disfrutar de tu cuenta' }
            #format.json { render :show, status: :created, location: @perfil_alumno }
          else
            format.html { render :new }
            #format.json { render json: @perfil_alumno.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:error] = "El usuario no es un tutor"
        render:new 
      end 
    else
      flash[:error] = "Tutor correo no encontrado"
      render:new 
    end     

    #raise @perfil_alumno.to_yaml
    #@perfil_alumno.perfil_tutor =

  end

  # PATCH/PUT /perfil_alumnos/1
  # PATCH/PUT /perfil_alumnos/1.json
  def update
    respond_to do |format|
      if @perfil_alumno.update(perfil_alumno_params)
        format.html { redirect_to @perfil_alumno, notice: 'Perfil alumno se actualizó correctamente' }
        #format.json { render :show, status: :ok, location: @perfil_alumno }
      else
        format.html { render :edit }
        #format.json { render json: @perfil_alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /perfil_alumnos/1
  # # DELETE /perfil_alumnos/1.json
  def destroy
    @perfil_alumno.destroy
    @perfil_alumno.user.update(perfilado:false)
    respond_to do |format|
      format.html { redirect_to perfil_alumnos_url, notice: 'Perfil alumno fue eliminado correctamente' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil_alumno
      @perfil_alumno = PerfilAlumno.find(params[:id])
    end

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
                                            :generacion_id)
    end
end
