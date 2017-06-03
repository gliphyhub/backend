# == Schema Information
#
# Table name: comunicados
#
#  id               :integer          not null, primary key
#  titulo           :string
#  mensaje          :text
#  mensaje_markdown :text
#  fecha_de_termino :date
#  visitas          :integer          default("0")
#  prioridad        :boolean
#  perfil_admin_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comunicado < ApplicationRecord
  belongs_to :perfil_admin
  has_one :comunicado_archivo, dependent: :destroy
  has_many :comunicado_grupos, dependent: :destroy
  has_many :grupos, :through => :comunicado_grupos 
end
