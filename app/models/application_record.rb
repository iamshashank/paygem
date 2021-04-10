class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  PAID = 1
  UNPAID = 0
  FAILED = 2
  REFUNDED = 3
end
