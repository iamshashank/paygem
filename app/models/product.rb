class Product < ApplicationRecord
    has_many :user_products, dependent: :destroy
    has_many :buyers, through: :user_products, source: :user, class_name: "User" 

    validates :price, numericality: { only_integer: true, greater_than: 50 }
end
