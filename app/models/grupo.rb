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
