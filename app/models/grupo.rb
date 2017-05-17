class Grupo < ApplicationRecord
  belongs_to :nivel
  belongs_to :grado
  belongs_to :turno
end
