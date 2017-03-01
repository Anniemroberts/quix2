class ReviewsController < ApplicationController
  def create
    review_params = params.require(:review).permit(:body)
    @review = Review.new review_params
    @idea = Idea.find params[:idea_id]
    @review.user = current_user
    @review.idea = @idea
    if @review.save
      redirect_to idea_path(params[:idea_id]), notice: 'Review created!'
    else
      flash[:alert] = 'please fix errors'
      render 'ideas/show'
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to idea_path(review.idea_id), notice: 'Review deleted!'
  end
end
