class ProfesorGrupo < ApplicationRecord
  belongs_to :perfil_profesor
  belongs_to :grupo
end
