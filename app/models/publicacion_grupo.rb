class PublicacionGrupo < ApplicationRecord
  belongs_to :grupo
  belongs_to :perfil_profesor
end
