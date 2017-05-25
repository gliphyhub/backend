# == Schema Information
#
# Table name: archivos
#
#  id             :integer          not null, primary key
#  publicacion_id :integer
#  nombre         :string
#  ruta           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Archivo < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  validates :publicacion_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  validates :ruta, presence: true, uniqueness: {case_sensitive: false, message: "Esa ruta ya existe."}
  validates :nombre, presence: true, length: {in: 5..50, message: "El nombre del archivo debe tener entre 5 y 50 caracteres."}
  ###################################################
  ####################Relaciones#####################
  belongs_to :publicacion_id, presence: {message: "Campo obligatorio."}, numericality: {only_integer: true}
  ###################################################
  ###################################################
end
