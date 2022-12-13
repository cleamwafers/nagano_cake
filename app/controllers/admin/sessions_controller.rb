class Admin::SessionsController < Devise::SessionsController

  # def new
  # end

  # def create
  #   admin = Admin.find_by(email: params[:session][:email].downcase)
  #   if admin && admin.authenticate(params[:session][:password])
  #     # ユーザーログイン後にユーザー情報のページにリダイレクトする
  #   else
  #     # エラーメッセージを作成する
  #     render 'new'
  #   end
  # end


end
