# == Schema Information
#
# Table name: publicacion_grupos
#
#  id             :integer          not null, primary key
#  grupo_id       :integer
#  publicacion_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PublicacionGrupo < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  validates :publicacion_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :grupo_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  ###################################################
  ####################Relaciones#####################
  belongs_to :grupo
  belongs_to :publicacion
  ###################################################
  ###################################################
end
