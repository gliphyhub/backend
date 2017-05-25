# == Schema Information
#
# Table name: tipos
#
#  id              :integer          not null, primary key
#  tipo_de_usuario :string
#

class Tipo < ApplicationRecord
	###################################################
    ##################Validaciones#####################
    #validates :materia, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El tipo debe tener entre 5 y 30 caracteres."}
	###################################################
    ####################Relaciones#####################
	has_many :users, dependent: :destroy
	###################################################
    ############Validaciones de relaciones#############
    #validates_associated :users
	###################################################
    ###################################################
end
