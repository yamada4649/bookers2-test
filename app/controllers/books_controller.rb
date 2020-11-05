class BooksController < ApplicationController
  def index
    @book = Book.all
  end

  def show
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
end
