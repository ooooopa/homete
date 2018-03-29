class Message < ApplicationRecord
  validates :message, presence: true
  validates :message, length: {in:1..140}
end
