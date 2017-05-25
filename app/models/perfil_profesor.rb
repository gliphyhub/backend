# == Schema Information
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
  ###################################################
  ##################Validaciones#####################
  validates :user_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :nss, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El NSS debe tener entre 5 y 30 caracteres."}
  validates :ap_paterno, presence: {message: "Campo obligatorio."}, length: {in: 4..20, message: "El apellido paterno debe tener entre 4 y 20 caracteres."}
  validates :ap_materno, presence: {message: "Campo obligatorio."}, length: {in: 4..20, message: "El apellido materno debe tener entre 4 y 20 caracteres."}
  validates :nombre, presence: {message: "Campo obligatorio."}, length: {in: 4..50, message: "El nombre debe tener entre 4 y 50 caracteres."}
  validates :fecha_de_nacimiento, presence: true
  validates :genero_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :calle, presence: {message: "Campo obligatorio."}, length: {in: 4..30, message: "La calle debe tener entre 4 y 30 caracteres."}
  validates :numero_exterior, presence: {message: "Campo obligatorio."}, length: {in: 1..10, message: "El número exterior debe tener entre 1 y 10 caracteres."}
  validates :numero_interior, presence: {message: "Campo obligatorio."}, length: {in: 1..10, message: "El número interior debe tener entre 1 y 10 caracteres."}
  validates :colonia, presence: {message: "Campo obligatorio."}, length: {in: 4..30, message: "La colonia debe tener entre 4 y 30 caracteres."}
  validates :delegacion_municipio, presence: {message: "Campo obligatorio."}, length: {in: 4..30, message: "La delegación o municipio debe tener entre 4 y 30 caracteres."}
  validates :codigo_postal, presence: {message: "Campo obligatorio."}, length: {is: 5, message: "El código postal debe tener 5 dígitos."}, numericality: {only_integer: true}
  validates :telefono_casa, presence: {message: "Campo obligatorio."}, length: {in: 8..15, message: "El teléfono de casa debe tener entre 8 y 15 dígitos."}, numericality: {only_integer: true}
  validates :telefono_celular, presence: {message: "Campo obligatorio."}, length: {in: 8..15, message: "El teléfono celular debe tener entre 8 y 15 dígitos."}, numericality: {only_integer: true}
  validates :telefono_recados, presence: {message: "Campo obligatorio."}, length: {in: 8..15, message: "El teléfono de recados debe tener entre 8 y 15 dígitos."}, numericality: {only_integer: true}
  validates :extension_recados, presence: {message: "Campo obligatorio."}, length: {in: 1..20, message: "La extension debe tener entre 1 y 20 caracteres."}
  ###################################################
  ##################Relaciones#######################
  belongs_to :user
  belongs_to :genero
  has_many :profesor_grupos, dependent: :destroy
  has_many :grupos, :through => :profesor_grupos #hacer manual
  has_many :profesor_materias, dependent: :destroy
  has_many :materias, :through => :profesor_materia #hacer manual
  has_many :profesor_publicaciones, dependent: :destroy
  has_many :publicaciones, :through => :profesor_publicaciones #hacer manual
  ###################################################
  ############Validaciones de relaciones#############
  validates_associated :profesor_publicaciones
  validates_associated :profesor_materias
  validates_associated :profesor_grupos
  ###################################################
  ###################################################
end
