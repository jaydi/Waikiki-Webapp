class Celeb < ActiveRecord::Base
  include AASM

  has_one :user

  attr_encrypted :password, :key => APP_CONFIG[:encryption_key]

  validates :email, :uniqueness => true

  enum status: {
    pending: 10,
    active: 20,
    deactivated: 30
  }

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :active
    state :deactivated

    event :initiate do
      transitions from: :pending, to: :active
    end

    event :deactivate do
      transitions from: :active, to: :deactivated
    end

    event :activate do
      transitions from: :deactivated, to: :active
    end
  end

  def info_filled?
    !name.blank? and !profile_pic.blank?
  end

  def paired?
    !user.blank?
  end

  def generate_auth_token
    token = (0...20).map { (65 + rand(26)).chr }.join
    update_attributes({auth_token: token, auth_tokened_at: Time.now})
    token
  end

end
