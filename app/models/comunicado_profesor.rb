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

class ComunicadoProfesor < ApplicationRecord
  belongs_to :perfil_profesor
  belongs_to :comunicado
end
