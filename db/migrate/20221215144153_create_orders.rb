class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

    t.intenger :customer_id, null: false, default: ""
    t.intenger :pay_type, null: false, default: "",enum status: {クレジットカード: 0, 銀行振込: 1}
    t.string :postal_code,null: false, default: ""
    t.string :address, null: false, defalt: ""
    t.string :name, null: false, defalt: ""
    t.intenger :total_payment, null: false, defalt: ""
    t.intenger :shopping_fee, null: false, defalt: ""
    t.intenger :status, null: false, defalt: "",enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

      t.timestamps
    end
  end
end
