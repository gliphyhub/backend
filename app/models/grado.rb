# == Schema Information
#
# Table name: grados
#
#  id    :integer          not null, primary key
#  grado :string
#

class Grado < ApplicationRecord
	has_many :grupos, dependent: :destroy
	has_many :materias, dependent: :destroy
end
