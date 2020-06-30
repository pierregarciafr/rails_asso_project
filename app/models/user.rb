class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :assos
  has_one :detail, as: :detailable
  has_many :events, as: :eventable
  accepts_nested_attributes_for :detail, :events
  validates :pseudo, length: { maximum: 30 }
  validates :email, length: { maximum: 50 }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Password.create(string, cost: cost)
  end

end
