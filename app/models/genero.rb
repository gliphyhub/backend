class Genero < ApplicationRecord
  has_many :perfil_admins, dependent: :destroy
  has_many :perfil_profesores, dependent: :destroy
  has_many :perfil_tutores, dependent: :destroy
  has_many :perfil_alumnos, dependent: :destroy
end
