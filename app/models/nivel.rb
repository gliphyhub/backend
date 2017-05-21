# == Schema Information
#
# Table name: niveles
#
#  id    :integer          not null, primary key
#  nivel :string
#

class Nivel < ApplicationRecord
	has_many :grupos, dependent: :destroy
	has_many :materias, dependent: :destroy
end
