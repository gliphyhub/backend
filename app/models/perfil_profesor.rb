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
