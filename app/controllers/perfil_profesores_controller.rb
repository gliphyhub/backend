class PerfilProfesoresController < ApplicationController
  before_action :set_perfil_profesor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!, only:[:index,:show,:update,:destroy,:edit]

  # GET /perfil_profesores
  # GET /perfil_profesores.json
  def index
    @perfil_profesores = PerfilProfesor.all
  end

  # GET /perfil_profesores/1
  # GET /perfil_profesores/1.json
  def show
  end
  #def set_current_user
    #PerfilProfesor.current_user = current_user
  #end

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
    @perfil_profesor.user= current_user
    #@perfil_profesor.grupos = params[:grupos]
    #@perfil_profesor.materias = params[:materias]
    #raise @perfil_profesor
    @grupos=params[:grupos]
    @materias=params[:materias]

    respond_to do |format|
      if @perfil_profesor.save
        current_user.update(perfilado:true)
         unless @grupos.nil?
            @grupos.each do | valor|
              ProfesorGrupo.create(grupo_id: valor,perfil_profesor_id:  @perfil_profesor.id)
            end      
         end
        unless @materias.nil?
          @materias.each do |materia, valor|
            ProfesorMateria.create(materia_id: valor,perfil_profesor_id:  @perfil_profesor.id)
          end      
        end
        format.html { redirect_to root_path, notice: '¡Bienvenido! Ya puedes disfrutar de tu cuenta' }
        #format.json { render :show, status: :created, location: @perfil_profesor }
      else
        format.html { render :new }
        #format.json { render json: @perfil_profesor.errors, status: :unprocessable_entity }
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
  #DELETE /perfil_profesores/1.json
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
      params.require(:perfil_profesor).permit(:nss,
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
                                              :grupos,
                                              :materias)
    end
end
