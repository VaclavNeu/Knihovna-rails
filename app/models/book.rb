class Book < ApplicationRecord
  has_many :loans, dependent: :restrict_with_error
  has_many :members, through: :loans

  validates :title, :author, presence: true, length: { minimum: 1, maximum: 200 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :isbn, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :isbn_must_be_valid
  before_validation :normalize_isbn


  def available_count
    quantity - loans.active.count
  end

  def available?
    available_count > 0
  end

  def has_active_loans?
    loans.active.any?
  end

  def deletable?
    !has_active_loans?
  end
  private

  def normalize_isbn
    self.isbn = isbn.gsub(/[-\s]/, "") if isbn.present?
  end

  def isbn_must_be_valid
    return if isbn.blank?

    unless isbn.length == 13
      errors.add(:isbn, "musí mít 13 znaků (ISBN-13)")
      return
    end

    unless valid_isbn_13?
      errors.add(:isbn, "není platné ISBN-13 (chybná kontrolní číslice)")
    end
  end

  def valid_isbn_13?
    return false unless isbn.match?(/\A\d{13}\z/)

    sum = isbn.chars.each_with_index.sum do |char, i|
      char.to_i * (i.even? ? 1 : 3)
    end

    (sum % 10).zero?
  end
end
