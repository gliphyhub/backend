class ProfesorPublicacion < ApplicationRecord
  belongs_to :publicacion
  belongs_to :perfil_profesor
end
