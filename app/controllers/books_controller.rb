class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.reverse_order
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to user_book_path
    else
      render 'book#create'
    end
  end

  def edit
    @book = current_user.book.find(params[:book_id])
    if @book.update
      flash[:notice] = "You have updated book successfully."
      redirect_to books_show_path
    else
      render :edit
    end
  end


  protected
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
