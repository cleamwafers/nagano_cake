class ApplicationController < ActionController::Base
   #before_action :authenticate_user!, except: [:top,:about]
   #before_action :configure_permitted_parameters, if: :devise_controller?

  #def after_admin_sign_in_path_for(resource)
    #admin_top_path
  #end

  #def after_admin_sign_out_path_for(resource)
    #root_path
  #end

  #def after_public_sign_in_path_for(resource)
    #flash[:notice] = "ようこそ @customer.name ."
    #public_path
  #end

  #def after_public_sign_out_path_for(resource)
    #root_path
  #end
end
