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
	has_many :archivos, dependent: :destroy
	has_many :publicacion_grupos, dependent: :destroy
	has_many :grupos, :through => :publicacion_grupos #manual el destroy
	has_many :profesor_publicaciones, dependent: :destroy
	has_many :perfil_profesores, :through => :profesor_publicaciones #manual el destroy
end
