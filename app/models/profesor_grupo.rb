# == Schema Information
#
# Table name: profesor_grupos
#
#  id                 :integer          not null, primary key
#  perfil_profesor_id :integer
#  grupo_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ProfesorGrupo < ApplicationRecord
  belongs_to :perfil_profesor
  belongs_to :grupo
end
