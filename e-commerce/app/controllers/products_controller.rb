class ProductsController < ApplicationController

  def index
    products_data()


  end

  # def show
  #   @product = Product.find params[:id]
  # end


  private

  def products_data
      data = RestClient.get 'http://localhost:3000/api/v1/products.json'
      puts JSON.parse(data.body)
      puts '=========================================='
  end

end
