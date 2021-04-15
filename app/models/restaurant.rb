class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :phone_number, :category, presence: true
  validates :category, inclusion: { in: ["Chinese", "Italian", "Japanese", "French", "Belgian"]}
end

#  https://stackoverflow.com/questions/10936988/add-star-ratings-to-my-model-rails3
