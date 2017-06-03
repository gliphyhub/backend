# == Schema Information
#
# Table name: comunicado_profesores
#
#  id                 :integer          not null, primary key
#  perfil_profesor_id :integer
#  comunicado_id      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ComunicadoProfesorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
