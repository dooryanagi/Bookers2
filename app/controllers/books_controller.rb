class BooksController < ApplicationController

  # 新規投稿機能
  def new
    @book = Book.new
  end

  # 保存機能
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
  end

  def index
  end
  
  # 保存のセキュリティのためのストロングパラメータ
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end
