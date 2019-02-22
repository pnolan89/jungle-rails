class ProductsController < ApplicationController
  before_action :require_login

  def index #WOULD BE TRANLATED TO THE /PRODUCTS GET
    @products = Product.all.order(created_at: :desc)

  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to post reviews."
    end
  end

end
