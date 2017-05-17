class Publicacion < ApplicationRecord
	has_many :archivos, dependent: :destroy
	has_many :publicacion_grupos, dependent: :destroy
	has_many :grupos, :through => :publicacion_grupos #manual el destroy
	has_many :profesor_publicaciones, dependent: :destroy
	has_many :perfil_profesores, :through => :profesor_publicaciones #manual el destroy
end
