class ProductsController < ApplicationController

  def index
    data = ApiCalls.new.products_data
    @products = JSON.parse(data.body)
  end

  def show
    # @products = ApiCalls.new.products_data
  end
end
