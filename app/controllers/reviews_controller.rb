class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.recipe_id = params[:id]
    @review.set_image(params[:review][:image])

    if @review.save
      redirect_to recipe_path(@review.recipe_id)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :image)
  end
end
