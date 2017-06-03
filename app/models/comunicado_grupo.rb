# == Schema Information
#
# Table name: comunicado_grupos
#
#  id            :integer          not null, primary key
#  grupo_id      :integer
#  comunicado_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ComunicadoGrupo < ApplicationRecord
  belongs_to :grupo
  belongs_to :comunicado
end
