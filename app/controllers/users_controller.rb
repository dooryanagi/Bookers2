class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    # 部分テンプレート使用のため追記(newから持ってくる)
    @book = Book.new
  end

  def index
    @users = User.all
    # 部分テンプレート使用のため追記(showから持ってくる)
    # idはcurrent_userを使う
    @user = User.find(current_user.id)
    # 部分テンプレート使用のため追記(newから持ってくる)
    @book = Book.new

  end

  # 編集
  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
    @user = User.find(params[:id])
  end

  # 更新
  def update
    @user = User.find(params[:id])
    # 本人以外が更新できないようにする
    unless @user.id == current_user.id
      redirect_to users_path
    end

    if @user.update(user_params)
      flash[:notice] = "You have edited user info successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private
  # ストロングパラメータ

  # updateを定義するときに追加
  def user_params
    # ★imageを追加したらpermitに追加
    params.require(:user).permit(:name, :introduction, :profile_image)
  end




end
