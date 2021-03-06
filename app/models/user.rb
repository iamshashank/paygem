class User < ApplicationRecord
  include Pay::Billable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, :trackable

  has_many :user_products, dependent: :destroy
  has_many :bought_products, through: :user_products, source: :product, class_name: "Product"



  def first_name
    name.split(" ").first
  end

  def last_name
    name.split(" ").slice(1...)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
