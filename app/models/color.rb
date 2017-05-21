# == Schema Information
#
# Table name: colores
#
#  id          :integer          not null, primary key
#  color       :string
#  descripcion :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Color < ApplicationRecord
	has_many :materias#,  dependent: :destroy
end
