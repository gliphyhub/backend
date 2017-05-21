# == Schema Information
#
# Table name: tipos
#
#  id              :integer          not null, primary key
#  tipo_de_usuario :string
#

class Tipo < ApplicationRecord
	has_many :users, dependent: :destroy
end
