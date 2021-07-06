class User < ApplicationRecord
  include BCrypt
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :initials, presence: true
  validates :email, presence: true

  has_one :access_token, dependent: :destroy
  has_many :routines, dependent: :destroy

  def password
    @password ||= Password.new(encrypted_password) if encrypted_password.present?
  end

  def password=(new_password)
    if new_password.blank?
      @password = new_password
    else
      @password = Password.create(new_password)
      self.encrypted_password = @password
    end
  end
end
