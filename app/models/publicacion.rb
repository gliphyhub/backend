# == Schema Information
#
# Table name: publicaciones
#
#  id               :integer          not null, primary key
#  titulo           :string
#  mensaje          :text
#  fecha_de_termino :date
#  prioridad        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Publicacion < ApplicationRecord
	###################################################
    ##################Validaciones#####################
    validates :titulo, presence: {message: "Campo obligatorio."}, length: {in: 5..30, message: "El título debe tener entre 5 y 30 caracteres."}
    validates :mensaje, presence: {message: "Campo obligatorio."}, length: {in: 5..255, message: "El mensaje debe tener entre 5 y 255 caracteres."}
    validates :fecha_de_termino, presence: true
    validates :prioridad, presence: true
	###################################################
    ####################Relaciones#####################
	has_many :archivos, dependent: :destroy
	has_many :publicacion_grupos, dependent: :destroy
	has_many :grupos, :through => :publicacion_grupos #manual el destroy
	has_many :profesor_publicaciones, dependent: :destroy
	has_many :perfil_profesores, :through => :profesor_publicaciones #manual el destroy
	###################################################
    ############Validaciones de relaciones#############
    validates_associated :archivos
    validates_associated :publicacion_grupos
    validates_associated :profesor_publicaciones
    validates_associated :perfil_profesores
    ###################################################
    ###################################################
end
