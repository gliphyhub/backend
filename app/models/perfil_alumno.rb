class PerfilAlumno < ApplicationRecord
  belongs_to :user
  belongs_to :genero
  belongs_to :generacion
  belongs_to :perfil_tutor
  belongs_to :grupo
end
