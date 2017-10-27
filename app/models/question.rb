class Question < ApplicationRecord
  validates :title, length: {maximum: 140}, presence: true

  has_many :answers, :dependent => :delete_all
end
