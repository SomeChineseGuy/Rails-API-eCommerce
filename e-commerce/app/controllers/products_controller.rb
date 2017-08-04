class ProductsController < ApplicationController

  def index
    data = ApiCalls.new.products_data
    puts JSON.parse(data.body)
    puts "==============="
  end
end
