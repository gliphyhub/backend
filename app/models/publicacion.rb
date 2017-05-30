# == Schema Information
#
# Table name: publicaciones
#
#  id               :integer          not null, primary key
#  titulo           :string
#  mensaje          :text
#  fecha_de_termino :date
#  prioridad        :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Publicacion < ApplicationRecord
	###################################################
    ##################Validaciones#####################
    validates :titulo, presence: true, length: {in: 5..30}
    validates :mensaje, presence: true, length: {in: 5..400}
    validates :fecha_de_termino, presence: true
    validate :expiration_date_cannot_be_in_the_past
    #validates :prioridad, presence: true
	###################################################
    ####################Relaciones#####################
	has_one :archivo, dependent: :destroy
	has_many :publicacion_grupos, dependent: :destroy
	has_many :grupos, :through => :publicacion_grupos #manual el destroy
	#has_many :profesor_publicaciones, dependent: :destroy
	#has_many :perfil_profesores, :through => :profesor_publicaciones #manual el destroy
	###################################################
    ############Validaciones de relaciones#############
    #validates_associated :archivos
    #validates_associated :publicacion_grupos
    #validates_associated :profesor_publicaciones
    #validates_associated :perfil_profesores
    ###################################################
    ###################################################
    def start_time
        self.created_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end
    private
  def expiration_date_cannot_be_in_the_past
    if fecha_de_termino.present? && fecha_de_termino < Date.today
      #errors.add(:expiration_date, "can't be in the past")
      errors.add(:fecha_de_termino,"no puede ser para el pasado")
    end
  end
end
