class Subscription < ApplicationRecord
  EMAIL_REGEXP = /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: EMAIL_REGEXP, unless: -> { user.present? }
  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }
  validate :same_user
  validate :existing_email

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  def same_user
    errors.add(self.user.name, I18n.t('controllers.subscriptions.error')) if user == event.user
  end

  def existing_email
    errors.add(:user_email, I18n.t('controllers.subscriptions.error')) if User.exists?(email: user_email)
  end
end
