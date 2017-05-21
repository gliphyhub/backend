# == Schema Information
#
# Table name: publicacion_grupos
#
#  id             :integer          not null, primary key
#  grupo_id       :integer
#  publicacion_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class PublicacionGrupoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
