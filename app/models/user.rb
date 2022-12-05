class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one :profile, dependent: :destroy

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
