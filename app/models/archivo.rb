# == Schema Information
#
# Table name: archivos
#
#  id             :integer          not null, primary key
#  publicacion_id :integer
#  nombre         :string
#  ruta           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Archivo < ApplicationRecord
  belongs_to :publicacion
end
