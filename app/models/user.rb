class User < ApplicationRecord
  has_many :achievements
  has_many :favorites, dependent: :destroy
  has_many :favorite_achievements, through: :favorites, source: :achievement
  has_many :messages

  validates :name, presence: true, length:{maximum:30}, on: :create
  validates :email, presence: true, length:{maximum:255},
                    format: {with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, on: :create
  before_save{email.downcase!}
  has_secure_password
  validates :password, presence: true, length:{minimum:6}, on: :create

  mount_uploader :image, ImageUploader

end
