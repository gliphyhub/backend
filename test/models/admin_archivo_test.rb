# == Schema Information
#
# Table name: admin_archivos
#
#  id                   :integer          not null, primary key
#  admin_publicacion_id :integer
#  nombre               :string
#  ruta                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class AdminArchivoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
