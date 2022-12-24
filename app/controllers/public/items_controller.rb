class Public::ItemsController < ApplicationController

  has_many :cart_items
  belongs_to :genres
  has_many :order_items

  def index
    @genres = Genre.all
    @items = Item.where(is_sale: true).page(params[:page]).per(8)
  end

  def show
    @Items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
	def product_params
		parmas.require(:item).permit(:image ,:name, :explanation, :tax_out_price, :is_sale)
	end
end
