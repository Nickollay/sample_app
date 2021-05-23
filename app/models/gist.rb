class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :hash_id, presence: true

  def url
    "https://gist.github.com/#{hash_id}"
  end
end
