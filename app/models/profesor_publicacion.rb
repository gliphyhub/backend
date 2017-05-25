# == Schema Information
#
# Table name: profesor_publicaciones
#
#  id                 :integer          not null, primary key
#  publicacion_id     :integer
#  perfil_profesor_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ProfesorPublicacion < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  validates :perfil_profesor_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :publicacion_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  ###################################################
  ####################Relaciones#####################
  belongs_to :publicacion
  belongs_to :perfil_profesor
  ###################################################
  ###################################################
end
