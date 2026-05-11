class Member < ApplicationRecord
  has_many :loans, dependent: :restrict_with_error
  has_many :books, through: :loans
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email musí být platný" }
end
