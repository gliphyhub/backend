# == Schema Information
#
# Table name: generos
#
#  id   :integer          not null, primary key
#  sexo :string
#

class Genero < ApplicationRecord
  ###################################################
  ##################Validaciones#####################
  validates :sexo, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El género debe tener entre 5 y 30 caracteres."}
  ###################################################
  ####################Relaciones#####################
  has_many :perfil_admins, dependent: :destroy
  has_many :perfil_profesores, dependent: :destroy
  has_many :perfil_tutores, dependent: :destroy
  has_many :perfil_alumnos, dependent: :destroy
  ###################################################
  ############Validaciones de relaciones#############
  validates_associated :perfil_profesores
  validates_associated :perfil_alumnos
  validates_associated :perfil_admins
  validates_associated :perfil_tutores
  ###################################################
  ###################################################
end
