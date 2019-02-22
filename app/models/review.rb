class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  valdiates :product, presence: true
  valdiates :user, presence: true
  valdiates :rating, presence: true
end
