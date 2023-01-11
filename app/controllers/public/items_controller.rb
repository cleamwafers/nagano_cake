class Public::ItemsController < ApplicationController

  # has_many :cart_items
  # belongs_to :genres
  # has_many :order_items

  def index
    @genres = Genre.all
    @item = Item.page(params[:page])
  end

  def show
    @Items = Item.all
    @Item = Item.new
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  def destroy
    item = Item.find(params[:id])  # データ（レコード）を1件取得
    item.destroy  # データ（レコード）を削除
    redirect_to items_path # 投稿一覧画面へリダイレクト
  end

  def update
    @item = Item.find(params[:id])
    # 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
    if @item.update(item_params)
     redirect_to item_path(@item),notice: "You have updated book successfully."
    else
     flash.now[:danger] = "error"
     @items = Item.all
     render :index
    end
  end
  def edit
    @item = Item.find(params[:id])
    @items = Item.new
  end

  private
	def item_params
		parmas.require(:item).permit(:image ,:name, :explanation, :tax_out_price, :is_sale)
	end
end
