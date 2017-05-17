class ProfesorMateria < ApplicationRecord
  belongs_to :perfil_profesor
  belongs_to :materia
end
