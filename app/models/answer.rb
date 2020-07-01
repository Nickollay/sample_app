class Answer < ApplicationRecord
  belongs_to :question

  scope :easy, -> { where(correct: true) }

  validates :body, presence: true
end
