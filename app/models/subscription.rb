class Subscription < ApplicationRecord
  EMAIL_REGEXP = /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do
    validates :user, uniqueness: {scope: :event_id}
    validate :same_user
  end

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: EMAIL_REGEXP
    validates :user_email, uniqueness: {scope: :event_id}
    validate :existing_email
  end

  def user_name
    user&.name || super
  end

  def user_email
    user&.email || super
  end

  private

  def same_user
    errors.add(:user_email, :same_user) if user == event.user
  end

  def existing_email
    errors.add(:user_email, :existing_email) if User.exists?(email: user_email)
  end
end
