class ProductsController < InheritedResources::Base

  before_filter :restrict_access

  def index
  	@products = Product.all
  	render json: @products
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
