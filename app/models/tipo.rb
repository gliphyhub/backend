class Tipo < ApplicationRecord
	has_many :users, dependent: :destroy
end
