# == Schema Information
#
# Table name: generaciones
#
#  id         :integer          not null, primary key
#  generacion :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Generacion < ApplicationRecord
	###################################################
    ##################Validaciones#####################
	#validates :generacion, presence: {message: "Campo obligatorio."}, , length: {in: 5..30, message: "La generación debe tener entre 5 y 30 caracteres."}
	###################################################
    ####################Relaciones#####################
	has_many :perfil_alumnos, dependent: :destroy
	###################################################
    ############Validaciones de relaciones#############
	validates_associated :perfil_alumnos
	###################################################
    ###################################################
end
