class ReviewsController < ApplicationController
  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    review = Review.new(review_params)
    if review.save
      redirect_to "/shelters/#{params[:shelter_id]}"
    else
      flash[:notice] = "You need to fill in a title, rating, and content in order to submit a shelter review"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:review_id])
    review.update(review_params)
    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  def destroy
    Review.delete(params[:review_id])

    redirect_to "/shelters/#{params[:shelter_id]}"
  end

  private

    def review_params
      params.permit(:title, :rating, :content, :image, :shelter_id)
    end
end