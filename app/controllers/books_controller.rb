class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    #using fancy rails magic
  end

  def new
    @book = Book.new
  end

  def edit
  end


  def create
    @book = Book.find_or_create_by(book_params)
      if @book.save
        flash[:notice] = "Your book was saved."
        redirect_to @book
      else
        flash[:alert] = "Your book could not be saved."
        render :new
      end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "Your book was updated."
      redirect_to @book

    else
      render :edit

    end
  end


  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :year)
    end
end
