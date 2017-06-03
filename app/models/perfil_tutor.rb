# == Schema Information
#
# Table name: perfil_tutores
#
#  id                   :integer          not null, primary key
#  user_id              :integer
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

class PerfilTutor < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  validates :ap_paterno, presence: true, length: {in: 2..20}
  validates :ap_materno, presence: true, length: {in: 2..20}
  validates :nombre, presence: true, length: {in: 2..50}
  #validates :fecha_de_nacimiento, presence: true
  validates :calle, presence: true, length: {in: 3..30}
  validates :numero_exterior, presence: true, length: {in: 1..8}, numericality: {only_integer: true}
  #validates :numero_interior, length: {in: 1..10}, numericality: {only_integer: true}
  validates :colonia, presence: true, length: {in: 4..30}
  validates :delegacion_municipio, presence: true, length: {in: 4..30}
  validates :codigo_postal, presence: true, length: {is: 5}, numericality: {only_integer: true}
  validates :telefono_casa, presence: true, length: {in: 8..10}, numericality: {only_integer: true}
  validates :telefono_celular, presence: true, length: {in: 10..12}, numericality: {only_integer: true}
  ###################################################
  ##################Relaciones#######################
  belongs_to :user
  belongs_to :genero
  has_many :perfil_alumnos, dependent: :destroy
  ###################################################
  ############Validaciones de relaciones#############
  #validates_associated :perfil_alumnos
  ###################################################
  ###################################################
end
