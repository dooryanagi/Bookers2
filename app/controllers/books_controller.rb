class BooksController < ApplicationController

  # 新規投稿機能
  def new
    @book = Book.new
  end

  # 保存機能
  def create
    # 許可されたカラムのデータをインスタンス変数に格納
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
    # renderの時は定義が必要
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  # 投稿毎の詳細ページ
  def show
    @book = Book.find(params[:id])
    # 部分テンプレート使用のため追記
    # idはcurrent_userを使う→投稿に紐づくユーザーを表示させたい
    @user = @book.user
  end

  # 一覧ページ
  def index
    @books = Book.all
    # 部分テンプレート使用のため追記
    # idはcurrent_userを使う
    @user = User.find(current_user.id)
    # 部分テンプレート使用のため追記(newから持ってくる)
    @book = Book.new
  end

  # 削除機能
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # 編集機能
  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
     end


    # 部分テンプレート使用のため追記
# booksこんとろーらなので@userはUserモデルから定義できない
    # @user = User.find(current_user.id)
    # 本人以外が編集できないようにアクションで定義
    # unless @user.id == current_user.id
      # redirect_to books_path
    # end

  end

  # 更新機能
  def update
    @book = Book.find(params[:id])
    # updateに引数を指定する必要がある
    # フラッシュメッセージの追加
    if @book.update(book_params)
      flash[:notice] = "You have edited book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  # 保存のセキュリティのためのストロングパラメータ
  private

  # フォームで入力されたデータが投稿データとして許可されたものか確認する
  def book_params
    # bookのモデルに対してpermit内に記述してあるカラム名のものは許可する
    params.require(:book).permit(:title, :body)
  end

end
