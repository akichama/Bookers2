class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @books = Book.user_id = current_user.id
    @book.save
      redirect_to books_path
  end
  
  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  def book_params
    params.require(:book).permit(:title, :Opinion)
  end

end