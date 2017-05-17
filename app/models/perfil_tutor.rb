class PerfilTutor < ApplicationRecord
  belongs_to :user
  belongs_to :genero
  has_many :perfil_alumnos, dependent: :destroy
end
