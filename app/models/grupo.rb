# == Schema Information
#
# Table name: grupos
#
#  id         :integer          not null, primary key
#  grupo      :string
#  nivel_id   :integer
#  grado_id   :integer
#  turno_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Grupo < ApplicationRecord
  belongs_to :nivel
  belongs_to :grado
  belongs_to :turno
  has_many :perfil_alumnos, dependent: :destroy
  has_many :materia_grupos, dependent: :destroy
  has_many :materias, :through => :materia_grupos #hacer manual el destroy
  has_many :profesor_grupos, dependent: :destroy
  has_many :perfil_profesores, :through => :profesor_grupos #hacer manual el destroy
  has_many :publicacion_grupos, dependent: :destroy
  has_many :publicaciones, :through => :publicacion_grupos #hacer manual el destroy
end
