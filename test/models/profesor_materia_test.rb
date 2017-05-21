# == Schema Information
#
# Table name: profesor_materias
#
#  id                 :integer          not null, primary key
#  perfil_profesor_id :integer
#  materia_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ProfesorMateriaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
