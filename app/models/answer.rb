class Answer < ApplicationRecord
  belongs_to :question

  scope :easy, -> { where(correct: true) }
end
