class Color < ApplicationRecord
	has_many :materias#,  dependent: :destroy
end
