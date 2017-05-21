# == Schema Information
#
# Table name: turnos
#
#  id    :integer          not null, primary key
#  turno :string
#

class Turno < ApplicationRecord
	has_many :grupos, dependent: :destroy
end
