class Api::V1::ProductsController < ApplicationController
  # before_filter :restrict_access
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
      authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end

    def product_params
      params.require(:product).permit(:name, :price, :quantity, :category_id)
    end
  end
end  
