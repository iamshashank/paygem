class Product < ApplicationRecord
    has_many :user_products
    has_many :buyers, through: :user_products, source: :user, class_name: "User" 
end
