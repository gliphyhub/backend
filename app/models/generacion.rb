# == Schema Information
#
# Table name: generaciones
#
#  id         :integer          not null, primary key
#  generacion :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Generacion < ApplicationRecord
	has_many :perfil_alumnos, dependent: :destroy
end
