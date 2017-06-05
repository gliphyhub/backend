# == Schema Information
#
# Table name: comunicados
#
#  id               :integer          not null, primary key
#  titulo           :string
#  mensaje          :text
#  mensaje_markdown :text
#  visitas          :integer          default("0")
#  prioridad        :boolean
#  perfil_admin_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comunicado < ApplicationRecord
	validates :titulo, presence: true, length: {in: 3..30}
    validates :mensaje, presence: true, length: {in: 15..3000}
	belongs_to :perfil_admin
	has_one :comunicado_archivo, dependent: :destroy
	has_many :comunicado_grupos, dependent: :destroy
	has_many :grupos, :through => :comunicado_grupos
	has_many :comunicado_profesores, dependent: :destroy
	has_many :perfil_profesores, :through => :comunicado_profesores
	has_many :comunicado_tutores, dependent: :destroy
	has_many :perfil_tutores, :through => :comunicado_tutores
def start_time
    self.created_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
end
end
