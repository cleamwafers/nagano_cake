class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  # belongs_to :gernes,dependent: :destroy
  # has_many :order_items
  # has_many :cart_items

  def index
     @Items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
     @item = Item.new(item_params)
    if @item.save
      flash[:notice] ="Item was successfully created"
      redirect_to admin_item_path(@item) # リダイレクト先変更
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] ="Item was successfully updated"
      redirect_to admin_item_path(@item)
    else
      render "show"
    end
  end

  private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end
