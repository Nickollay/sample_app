class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true

  validate :answer_quantity

  private

  def answer_quantity
    if question.answers.count > 4
      errors.add(:test, "can't include more than 4 answers.")
    end
  end
end
