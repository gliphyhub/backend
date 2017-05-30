## == Schema Information
#
# Table name: perfil_profesores
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  nss                  :string
#  ap_paterno           :string
#  ap_materno           :string
#  nombre               :string
#  fecha_de_nacimiento  :date
#  genero_id            :integer
#  calle                :string
#  numero_exterior      :string
#  numero_interior      :string
#  colonia              :string
#  delegacion_municipio :string
#  codigo_postal        :string
#  telefono_casa        :string
#  telefono_celular     :string
#  telefono_recados     :string
#  extension_recados    :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class PerfilProfesor < ApplicationRecord
  #cattr_accessor :current_user
  ###################################################
  ##################Validaciones#####################
  validates :nss, presence:true, length: {in: 5..30}, numericality: {only_integer: true}, uniqueness: true
  validates :ap_paterno, presence: true, length: {in: 2..20}, format: { with: /\A[a-zA-Z]+\z/,
    message: "no puede contener numeros" }
  validates :ap_materno, presence: true, length: {in: 2..20}, format: { with: /\A[a-zA-Z]+\z/,
    message: "no puede contener numeros" }
  validates :nombre, presence: true, length: {in: 2..50}
  validates :fecha_de_nacimiento, presence: true
  validates :calle, presence: true, length: {in: 4..30}
  validates :numero_exterior, presence: true, length: {in: 1..10}, numericality: {only_integer: true}
  validates :numero_interior, presence: true, length: {in: 1..10}, numericality: {only_integer: true}
  validates :colonia, presence: true, length: {in: 4..30}
  validates :delegacion_municipio, presence: true, length: {in: 4..30}
  validates :codigo_postal, presence: true, length: {is: 5}, numericality: {only_integer: true}
  validates :telefono_casa, presence: true, length: {in: 8..15}, numericality: {only_integer: true}
  validates :telefono_celular, presence: true, length: {in: 8..15}, numericality: {only_integer: true}
  ###################################################
  ##################Relaciones#######################
  belongs_to :user
  belongs_to :genero
  has_many :profesor_grupos, dependent: :destroy
  has_many :grupos, :through => :profesor_grupos #hacer manual
  has_many :profesor_materias, dependent: :destroy
  has_many :materias, :through => :profesor_materias #hacer manual
  has_many :publicaciones, dependent: :destroy
  ###################################################
  ############Validaciones de relaciones#############
  #validates_associated :profesor_publicaciones
  #validates_associated :profesor_materias
  #validates_associated :profesor_grupos
  ###################################################
  ###################################################
  #scope :publicados, ->{ where (grupos)}
  # after_create :guarda_grupos
  # after_create :guarda_materias
  #  def grupos=(value)
  #    @grupos=value #se guarda el arreglo
  #  end
  #  def guarda_grupos
  #    unless @grupos.nil?
  #      @grupos.each do |grupo, valor|
  #        ProfesorGrupo.create(grupo_id: valor,perfil_profesor_id:  @perfil_profesor.id)#PerfilProfesor.current_user.id)
  #      end      
  #    end
  #  end
  #  def materias=(value)
  #    @materias=value #se guarda el arreglo
  #  end
  #  def guarda_materias
  #    unless @materias.nil?
  #      @materias.each do |materia, valor|
  #        ProfesorMateria.create(materia_id: valor,perfil_profesor_id:  @perfil_profesor.id)#PerfilProfesor.current_user.id)
  #      end      
  #    end
  #  end
end
