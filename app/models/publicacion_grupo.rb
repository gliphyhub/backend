class PublicacionGrupo < ApplicationRecord
  belongs_to :grupo
  belongs_to :publicacion
end
