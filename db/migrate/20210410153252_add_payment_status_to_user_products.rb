class AddPaymentStatusToUserProducts < ActiveRecord::Migration[6.1]
  def change
    #add this to all billable models to tack payment

    add_column :user_products, :payment_status, :integer, limit: 1
    add_column :users, :payment_status, :integer, limit: 1
  end
end
