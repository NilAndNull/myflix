# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  full_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_digest :string
#  remembered_at   :datetime
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ActiveRecord::Base
  has_secure_password

  validates :email,     uniqueness: true
  validates :email,     presence: true
  validates :password,  presence: true, on: :create
  validates :full_name, presence: true

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attributes(remember_digest: User.digest(remember_token),
                      remembered_at: Time.zone.now)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    # Returns a random token.
    def self.new_token
      SecureRandom.urlsafe_base64
    end

end
