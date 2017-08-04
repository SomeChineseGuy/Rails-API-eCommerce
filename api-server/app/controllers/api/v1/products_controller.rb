class Api::V1::ProductsController < ApplicationController

  before_filter :restrict_access
  respond_to :json
    def index
      @products = Product.all
      render json: @products
    end

    def show
      respond_with Product.find(params[:id])
    end
   private

    def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key

    end

    def product_params
      params.require(:product).permit(:name, :price, :quantity, :category_id)
    end
end  
