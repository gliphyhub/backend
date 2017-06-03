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
  ###################################################
  ##################Validaciones#####################
  validates :grupo, presence: {message: "Campo obligatorio."}
  validates :nivel_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :grado_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :turno_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  ###################################################
  ####################Relaciones#####################
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
  has_many :comunicado_grupos, dependent: :destroy
  has_many :publicaciones, :through => :comunicado_grupos
  ###################################################
  ############Validaciones de relaciones#############
  validates_associated :perfil_alumnos
  validates_associated :materia_grupos
  validates_associated :profesor_grupos
  validates_associated :perfil_profesores
  validates_associated :publicacion_grupos
  validates_associated :publicaciones
  ###################################################
  ###################################################
end