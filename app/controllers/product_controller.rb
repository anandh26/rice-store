class ProductController < ApplicationController
  def index
    @products = Product.where(category: 1).all
  end

  def detail
    @detail = Product.find_by(id: params[:id])
  end

  def shop_by_category
    if params[:category].present? && params[:category] == 'rice'
      @products = Product.where(category: 1).all
    else
      @products = Product.where(category: 2).all
    end
  end

  def shop_cart

  end

  def shop_checkout

  end

  def shop_payment

  end

  def shop_review

  end

  def shop_complete

  end
end
