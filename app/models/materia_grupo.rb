# == Schema Information
#
# Table name: materia_grupos
#
#  id         :integer          not null, primary key
#  materia_id :integer
#  grupo_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MateriaGrupo < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  validates :grupo_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :materia_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  ###################################################
  ####################Relaciones#####################
  belongs_to :materia
  belongs_to :grupo
  ###################################################
  ###################################################
end
