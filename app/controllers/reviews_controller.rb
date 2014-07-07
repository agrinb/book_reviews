class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    #wanted to see if this works, it appears it does
    @review = @book.reviews.build
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    if @review.save
      flash[:notice] = "Review was successfully created."
      redirect_to @book
    else
      flash[:alert] = "Sorry, your review could not be saved"
      render :new
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
