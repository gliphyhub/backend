class Generacion < ApplicationRecord
	has_many :perfil_alumnos, dependent: :destroy
end
