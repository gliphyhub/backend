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
  belongs_to :nivel
  belongs_to :grado
  belongs_to :color
  has_many :materia_grupos, dependent: :destroy
  has_many :grupos, :through => :materia_grupos #manual el destroy
  has_many :profesor_materias, dependent: :destroy
  has_many :perfil_profesores, :through => :profesor_materias #manual el destroy
end
