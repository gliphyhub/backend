# == Schema Information
#
# Table name: profesor_grupos
#
#  id                 :integer          not null, primary key
#  perfil_profesor_id :integer
#  grupo_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ProfesorGrupoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
