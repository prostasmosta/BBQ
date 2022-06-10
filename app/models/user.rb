class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:vkontakte, :yandex]

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

  def self.find_for_vk_oauth(access_token)
    email = access_token.extra.raw_info.domain+'@vk.com'

    user = where(email: email).first
    return user if user.present?

    provider = access_token.provider
    # id = access_token.uid
    url = access_token.info.urls.Vkontakte
    name = access_token.info.name

    where(url: url, provider: provider).first_or_create! do |user|
      user.name = name
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  def self.find_for_yandex_oauth(access_token)
    email = access_token.info.email

    user = where(email: email).first
    return user if user.present?

    provider = access_token.provider
    # id = access_token.uid
    url = access_token.extra.raw_info.id
    name = access_token.info.name

    where(url: url, provider: provider).first_or_create! do |user|
      user.name = name
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  def set_name
    self.name = "User #{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
