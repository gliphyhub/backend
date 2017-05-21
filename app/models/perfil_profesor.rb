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
  belongs_to :user
  belongs_to :genero
  has_many :profesor_grupos, dependent: :destroy
  has_many :grupos, :through => :profesor_grupos #hacer manual
  has_many :profesor_materias, dependent: :destroy
  has_many :materias, :through => :profesor_materia #hacer manual
  has_many :profesor_publicaciones, dependent: :destroy
  has_many :publicaciones, :through => :profesor_publicaciones #hacer manual
end
