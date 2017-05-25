# == Schema Information
#
# Table name: materias
#
#  id         :integer          not null, primary key
#  materia    :string
#  nivel_id   :integer
#  grado_id   :integer
#  color_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Materia < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  validates :materia, presence: {message: "Campo obligatorio."}, length: {in: 5..50, message: "La materia debe tener entre 5 y 50 caracteres."}
  validates :nivel_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :grado_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :color_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  ###################################################
  ####################Relaciones#####################
  belongs_to :nivel
  belongs_to :grado
  belongs_to :color
  has_many :materia_grupos, dependent: :destroy
  has_many :grupos, :through => :materia_grupos #manual el destroy
  has_many :profesor_materias, dependent: :destroy
  has_many :perfil_profesores, :through => :profesor_materias #manual el destroy
  ###################################################
  ############Validaciones de relaciones#############
  validates_associated :grupos
  validates_associated :materia_grupos
  validates_associated :profesor_materias
  validates_associated :perfil_profesores
  ###################################################
  ###################################################
end
