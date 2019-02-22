class ProductsController < ApplicationController

  def index #WOULD BE TRANLATED TO THE /PRODUCTS GET
    @products = Product.all.order(created_at: :desc)

  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

end
