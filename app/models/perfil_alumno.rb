# == Schema Information
#
# Table name: perfil_alumnos
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  matricula            :string
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
#  grupo_id             :integer
#  generacion_id        :integer
#  perfil_tutor_id      :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class PerfilAlumno < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  #validates :matricula, presence:true, length: {in: 5..30}, numericality: {only_integer: true}, uniqueness: true
  validates :ap_paterno, presence: true, length: {in: 2..20}, format: { with: /\A[a-zA-Z]+\z/,
    message: "no puede contener numeros" }
  validates :ap_materno, presence: true, length: {in: 2..20}, format: { with: /\A[a-zA-Z]+\z/,
    message: "no puede contener numeros" }
  validates :nombre, presence: true, length: {in: 2..50}
  #validates :fecha_de_nacimiento, presence: true
  #validates :calle, presence: true, length: {in: 4..30}
  #validates :numero_exterior, presence: true, length: {in: 1..10}, numericality: {only_integer: true}
  #validates :numero_interior, presence: true, length: {in: 1..10}, numericality: {only_integer: true}
  #validates :colonia, presence: true, length: {in: 4..30}
  #validates :delegacion_municipio, presence: true, length: {in: 4..30}
  #validates :codigo_postal, presence: true, length: {is: 5}, numericality: {only_integer: true}
  #validates :telefono_casa, presence: true, length: {in: 8..15}, numericality: {only_integer: true}
  #validates :telefono_celular, presence: true, length: {in: 8..15}, numericality: {only_integer: true}
  #validates :grupo_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  #validates :generacion_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  #validates :perfil_tutor_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  ###################################################
  ##################Relaciones#######################
  belongs_to :user
  belongs_to :genero
  belongs_to :generacion
  belongs_to :perfil_tutor
  belongs_to :grupo
  ###################################################
  ###################################################
end
