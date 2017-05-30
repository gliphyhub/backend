# == Schema Information
#
# Table name: admin_publicaciones
#
#  id               :integer          not null, primary key
#  titulo           :string
#  mensaje          :text
#  mensaje_markdown :text
#  fecha_de_termino :date
#  prioridad        :boolean
#  perfil_admin_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class AdminPublicacion < ApplicationRecord
  validates :titulo, presence: true, length: {in: 3..30}
  validates :mensaje, presence: true, length: {in: 15..400}
  validates :fecha_de_termino, presence: true
  validate :expiration_date_cannot_be_in_the_past
  has_one :admin_archivo, dependent: :destroy
  belongs_to :perfil_admin
end
