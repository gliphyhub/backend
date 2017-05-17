class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :tipo
  has_one :perfil_admin, dependent: :destroy
  has_one :perfil_profesor, dependent: :destroy
  has_one :perfil_tutor, dependent: :destroy
  has_one :perfil_alumno, dependent: :destroy
end
