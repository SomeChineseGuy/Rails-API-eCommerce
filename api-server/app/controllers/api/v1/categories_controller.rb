class Api::V1::CategoriesController < ApplicationController

  # before_filter :restrict_access

  def index
  	@categories = Category.all
  	render json: @categories
  end

  def show
    respond_with Category.find(params[:id])
  end

  def create
    respond_with Category.create(params[:category])
  end

  def update
    respond_with Category.update(params[:id], params[:category])
  end

  def destroy
    respond_with Category.destroy(params[:id])
  end  


  private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end

