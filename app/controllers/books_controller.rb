class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only:[:edit, :update]

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
    @book.user_id = @user.id
    @book_detail = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = @user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book_detail = Book.find(params[:id])
    @book_detail.destroy
    flash[:notice] = "Book was successfully deleted."
    redirect_to books_path
  end

  protected
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    editing_user = @book.user
    if current_user != editing_user
      redirect_to books_path
    end
  end


end
