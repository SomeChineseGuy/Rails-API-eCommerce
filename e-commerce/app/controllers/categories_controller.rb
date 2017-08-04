class CategoriesController < ApplicationController

  def index
    data = ApiCalls.new.categories_data
    puts data
    puts "==============="
  end
end
