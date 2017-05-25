# == Schema Information
#
# Table name: turnos
#
#  id    :integer          not null, primary key
#  turno :string
#

class Turno < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
    validates :turno, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El turno debe tener entre 5 y 30 caracteres."}
  ###################################################
  ####################Relaciones#####################
	  has_many :grupos, dependent: :destroy
  ###################################################
  ############Validaciones de relaciones#############
    validates_associated :grupos
  ###################################################
  ###################################################
end
