class Api::V1::CategoriesController < ApplicationController

  before_filter :restrict_access

  def index
  	@categories = Category.all
  	render json: @categories
  end

  def show
    respond_with Category.find(params[:id])
  end


  private

    def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end

