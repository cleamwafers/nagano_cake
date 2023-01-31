# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  protected
   # 退会しているかを判断するメソッド
  def customer_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@customer
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted ==false)
    flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    redirect_to new_customer_registration_path
    ## 【処理内容3】「1」と「2」の処理が真(true)だった場合、そのアカウントのis_deletedカラムに格納されている値を確認し
      # trueだった場合、退会しているのでサインアップ画面に遷移する
  else
      flash[:notice] = "項目を入力してください"
      # falseだった場合、
    # true && false == false
  end
  end
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  # end

  # # POST /resource/sign_in
  # def create
  # end

  # # DELETE /resource/sign_out
  # def destroy
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
