class Order < ApplicationRecord

 has_many :order_items
 belongs_to :customer
 has_one_attached :image

  enum pay_type: {credit_card: 0, bank_transfer: 1}

  enum status: {waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4}

end
