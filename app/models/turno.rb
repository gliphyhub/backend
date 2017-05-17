class Turno < ApplicationRecord
	has_many :grupos, dependent: :destroy
end
