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
  belongs_to :user
  belongs_to :genero
  has_many :perfil_alumnos, dependent: :destroy
end
