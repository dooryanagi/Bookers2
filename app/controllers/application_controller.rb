class ApplicationController < ActionController::Base
  # ログイン認証が完了していないユーザーはtopとaboutしか行けない
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインインの遷移先を一覧にする
  # deviseのメソッド
  # resourceという引数にはログインを実行したUserモデルのデータであるインスタンスが格納されている
  def after_sign_in_path_for(resource)
    # books_path→users_path(current_user.id)
    user_path(current_user.id)
  end


  # privateとは異なり他のコントローラからも参照できる
  protected

  # メソッドとして定義することでbefore_actionを用いれるようになる
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permitメソッド、サインイン時にkeyのデータ操作を許可している
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
