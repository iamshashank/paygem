# frozen_string_literal: true

class AddPayBillableToUserProducts < ActiveRecord::Migration[6.1]
  def change
    change_table :user_products do |t|
      t.string :processor
      t.string :processor_id
      t.datetime :trial_ends_at
      t.string :card_type
      t.string :card_last4
      t.string :card_exp_month
      t.string :card_exp_year
      t.text :extra_billing_info
    end
  end
end
