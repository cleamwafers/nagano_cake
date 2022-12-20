class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

    t.integer :customer_id, null: false, default: ""
    t.integer :pay_type, null: false, default: ""
    t.string :postal_code,null: false, default: ""
    t.string :address, null: false, defalt: ""
    t.string :name, null: false, defalt: ""
    t.integer :total_payment, null: false, defalt: ""
    t.integer :shopping_fee, null: false, defalt: ""
    t.integer :status, null: false, defalt: ""

      t.timestamps
    end
  end
end
