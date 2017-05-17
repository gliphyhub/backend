class Materia < ApplicationRecord
  belongs_to :nivel
  belongs_to :grado
  belongs_to :color
end
