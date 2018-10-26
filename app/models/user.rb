class User < ApplicationRecord
  has_secure_password
  has_many :jobs, foreign_key: :user_id
  has_many :clients, foreign_key: :user_id
  enum role: [:admin, :preparer]

  validates_presence_of :first_name, :last_name, :email, :role, :password_digest
end
