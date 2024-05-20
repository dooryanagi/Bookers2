class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
  end

  # 編集
  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
    # 飯テロでは@userも定義していた
    @user = User.find(params[:id])
  end

  # 更新
  def update
    # どっちの変数だろう？
    user = User.fing(params[:id])
    # 本人以外が更新できないようにする
    unless user.id == current_user.id
      redirect_to users_path
    end

    @user = User.find(params[:id])
    @user = update(user_params)
    # update userしても遷移しない？
    redirect_to user_path(@user.id)
  end

private
  # ストロングパラメータ

  # updateを定義するときに追加
  def user_params
    # ★introductionとimageを追加したらpermitに追加
    params.require(:user).permit(:name)
  end




end