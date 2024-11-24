class ApplicationController < ActionController::Base
  # ログインしていない状態で　トップページ以外にアクセスすると　ログインページに
  before_action :authenticate_user!, except: [:top]

  # devise利用の機能前に　protected に記述されている　configure_permitted_parameters を処理
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # sign in時の移行先
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  # sign out 時の移行先
  def after_sign_out_path_for(resource)
    root_path
  end

  # devise のストロングパラメータはここに記入
  protected
  # sign up の時　パラメータemail を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
