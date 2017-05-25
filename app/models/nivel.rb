# == Schema Information
#
# Table name: niveles
#
#  id    :integer          not null, primary key
#  nivel :string
#

class Nivel < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
    validates :nivel, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El nivel debe tener entre 5 y 30 caracteres."}
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
