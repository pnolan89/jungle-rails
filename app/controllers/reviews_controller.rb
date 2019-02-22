class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    @product = Product.find(params[:product_id])
    puts 'REVIEW OBJECT:'
    puts @review
    puts @review.user_id
    if @review.save
      redirect_to controller: 'products', action: 'show', id: params[:product_id], notice: 'Review saved!'
    else
      redirect_to controller: 'products', action: 'show', id: params[:product_id], notice: 'Not saved...'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to controller: 'products', action: 'show', id: params[:product_id]
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to post reviews."
      redirect_to controller: 'products', action: 'show', id: params[:product_id]
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id
    )
  end
end
