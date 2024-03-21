class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
     render :index
    end
    
  end
  
  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end