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

class ComunicadoArchivo < ApplicationRecord
  belongs_to :comunicado
end
