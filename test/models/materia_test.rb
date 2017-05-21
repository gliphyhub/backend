# == Schema Information
#
# Table name: materias
#
#  id         :integer          not null, primary key
#  materia    :string
#  nivel_id   :integer
#  grado_id   :integer
#  color_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MateriaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
