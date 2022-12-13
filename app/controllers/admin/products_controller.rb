class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
     @products = Product.all.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
     @product = Product.new(product_params)
    if @product.save
      flash[:notice] ="Product was successfully created"
      redirect_to admin_product_path(@product) # リダイレクト先変更
    else
      render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] ="Product was successfully updated"
      redirect_to admin_product_path(@product)
    else
      render "show"
    end
  end

  private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end
  def product_params
    params.require(:product).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end
end
