class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [30, 30]
  end

  validates :name, presence: true, length: {maximum: 35}
  validates :avatar, content_type: %i[img png jpg jpeg]

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create


  private

  def set_name
    self.name = "User #{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
