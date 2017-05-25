# == Schema Information
#
# Table name: grados
#
#  id    :integer          not null, primary key
#  grado :string
#

class Grado < ApplicationRecord
	###################################################
    ##################Validaciones#####################
    validates :grado, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El grado debe tener entre 5 y 30 caracteres."}
	###################################################
    ####################Relaciones#####################
	has_many :grupos, dependent: :destroy
	has_many :materias, dependent: :destroy
	###################################################
    ############Validaciones de relaciones#############
    validates_associated :grupos
    validates_associated :materias
	###################################################
    ###################################################
end
