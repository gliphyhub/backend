# == Schema Information
#
# Table name: comunicado_archivos
#
#  id            :integer          not null, primary key
#  comunicado_id :integer
#  nombre        :string
#  ruta          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ComunicadoArchivoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
