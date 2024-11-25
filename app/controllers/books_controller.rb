class BooksController < ApplicationController
  def new
    @book = book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        #  "flash[:notice] = 'メッセージ内容'"　リクエスト間を超えてメッセージを表示するための仕組み
         flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render :index
      end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end

    # @book = Book.find(params[:id]) こうでも動いたが、bookに同じものが入ってるので下記のほうが無駄なデータベースアクセスをしていないかもしれない？
    @book = book
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      #  "flash[:notice] = 'メッセージ内容'"　リクエスト間を超えてメッセージを表示するための仕組み
       flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, )
  end
end
