# == Schema Information
#
# Table name: colores
#
#  id          :integer          not null, primary key
#  color       :string
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Color < ApplicationRecord
	###################################################
    ##################Validaciones#####################
	validates :color, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El color debe tener entre 5 y 30 caracteres."}
	validates :descripcion, presence: {message: "Campo obligatorio."}
	###################################################
    ####################Relaciones#####################
	has_many :materias#,  dependent: :destroy
	###################################################
    ############Validaciones de relaciones#############
	validates_associated :materias
	###################################################
    ###################################################
end
