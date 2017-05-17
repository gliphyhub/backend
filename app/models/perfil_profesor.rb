class PerfilProfesor < ApplicationRecord
  belongs_to :user
  belongs_to :genero
end
