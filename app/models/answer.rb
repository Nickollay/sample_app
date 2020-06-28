class Answer < ApplicationRecord

  has_many :answers_users
  has_many :users, through: :answers_users

  belongs_to :question
  belongs_to :user
end
