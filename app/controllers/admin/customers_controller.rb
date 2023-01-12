class Admin::CustomersController < ApplicationController
before_action :authenticate_admin!

# has_many :orders
# has_many : addresses
# has_many : cart_items

 def index
  @customers = Customer.page(params[:page])
 end

 def show
  @customer = Customer.find(params[:id])
 end

 def edit
  @customer = Customer.find(params[:id])
 end

 def update
  @customer = Customer.find(params[:id])
			if @customer.update(customer_params)
			   flash[:success] = "Customer was successfully updated"
			   redirect_to admin_customer_path
			else
				render "edit"
			end

 end

 private
 def customer_params
	  params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postcode,:city,:phone_number,:email,:is_deleted)
 end
end
