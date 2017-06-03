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

class ComunicadoTutor < ApplicationRecord
  belongs_to :perfil_tutor
  belongs_to :comunicado
end
