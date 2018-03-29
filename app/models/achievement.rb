class Achievement < ApplicationRecord
  has_many :message, dependent: :destroy
  
  validates :content, presence: true
  validates :content, length: {in:1..140}
end
