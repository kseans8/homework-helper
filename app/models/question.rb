class Question < ApplicationRecord
  validates :title, presence: true

  has_many :answers, :dependent => :delete_all
end
