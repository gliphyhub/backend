# == Schema Information
#
# Table name: admin_publicaciones
#
#  id               :integer          not null, primary key
#  titulo           :string
#  mensaje          :text
#  mensaje_markdown :text
#  fecha_de_termino :date
#  prioridad        :boolean
#  perfil_admin_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class AdminPublicacionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
