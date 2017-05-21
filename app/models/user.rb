# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  tipo_id                :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
