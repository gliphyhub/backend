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
  belongs_to :user
  belongs_to :genero
  belongs_to :generacion
  belongs_to :perfil_tutor
  belongs_to :grupo
end
