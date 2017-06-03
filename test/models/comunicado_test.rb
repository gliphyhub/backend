# == Schema Information
#
# Table name: comunicados
#
#  id               :integer          not null, primary key
#  titulo           :string
#  mensaje          :text
#  mensaje_markdown :text
#  visitas          :integer          default("0")
#  prioridad        :boolean
#  perfil_admin_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ComunicadoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
