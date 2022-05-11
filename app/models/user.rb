class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  validates :name, presence: true, length: {maximum: 35}

  before_validation :set_name, on: :create
end
