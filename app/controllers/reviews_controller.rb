class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]


  def new
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build
  end


  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book_id = @book.id
      if @review.save
        redirect_to @book, notice: 'Review was successfully created.'
      else
        render :new
      end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating, :book_id)
    end
end
