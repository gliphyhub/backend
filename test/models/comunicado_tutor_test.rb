# == Schema Information
#
# Table name: comunicado_tutores
#
#  id              :integer          not null, primary key
#  perfil_tutor_id :integer
#  comunicado_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ComunicadoTutorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
