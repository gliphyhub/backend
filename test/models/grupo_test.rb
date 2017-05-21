# == Schema Information
#
# Table name: grupos
#
#  id         :integer          not null, primary key
#  grupo      :string
#  nivel_id   :integer
#  grado_id   :integer
#  turno_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GrupoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
