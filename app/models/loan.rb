class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :member

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :book_must_be_available, on: :create

  scope :active, -> { where(returned_at: nil) }
  scope :returned, -> { where.not(returned_at: nil) }

  def returned?
    returned_at.present?
  end

  def active?
    !returned?
  end

  def deletable?
    returned?
  end

  def mark_as_returned!
    update(returned_at: Time.current)
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "musí být po datu zahájení")
    end
  end

  def book_must_be_available
    return if book.blank?
    if book.available_count <= 0
      errors.add(:book, "není momentálně k dispozici (všechny výtisky jsou vypůjčené)")
    end
  end
end
