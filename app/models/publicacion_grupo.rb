# == Schema Information
#
# Table name: publicacion_grupos
#
#  id             :integer          not null, primary key
#  grupo_id       :integer
#  publicacion_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PublicacionGrupo < ApplicationRecord
  belongs_to :grupo
  belongs_to :publicacion
end
