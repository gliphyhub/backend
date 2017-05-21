# == Schema Information
#
# Table name: profesor_publicaciones
#
#  id                 :integer          not null, primary key
#  publicacion_id     :integer
#  perfil_profesor_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ProfesorPublicacionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
