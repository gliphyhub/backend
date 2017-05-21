# == Schema Information
#
# Table name: profesor_publicaciones
#
#  id                 :integer          not null, primary key
#  publicacion_id     :integer
#  perfil_profesor_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ProfesorPublicacion < ApplicationRecord
  belongs_to :publicacion
  belongs_to :perfil_profesor
end
