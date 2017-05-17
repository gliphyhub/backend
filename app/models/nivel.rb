class Nivel < ApplicationRecord
	has_many :grupos, dependent: :destroy
	has_many :materias, dependent: :destroy
end
