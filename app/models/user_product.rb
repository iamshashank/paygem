class UserProduct < ApplicationRecord
  include Pay::Billable
  belongs_to :user
  belongs_to :product
  

  def email
    user.email
  end
  def first_name
    user.first_name
  end
  def last_name
    user.last_name
  end


end
