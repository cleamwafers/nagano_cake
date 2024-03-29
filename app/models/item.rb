class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  has_many :order_items
  has_many :cart_items

 def get_image(width,height)
    unless image.attached?
     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
 end

   def with_tax_price
    (price * 1.1).floor
   end

   def subtotal
    item.with_tax_price * amount
   end
end
