class Answer < ApplicationRecord
  validates :answer, presence: true

  belongs_to :user
  belongs_to :question
end
