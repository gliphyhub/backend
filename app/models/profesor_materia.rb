# == Schema Information
#
# Table name: profesor_materias
#
#  id                 :integer          not null, primary key
#  perfil_profesor_id :integer
#  materia_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ProfesorMateria < ApplicationRecord
  belongs_to :perfil_profesor
  belongs_to :materia
end
