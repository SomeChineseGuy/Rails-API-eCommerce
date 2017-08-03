class ProductsController < InheritedResources::Base

  # before_filter :restrict_access

  def index
  	@products = Product.all
  	render json: @products
  end

    def show
      respond_with Product.find(params[:id])
    end

    def create
      respond_with Product.create(params[:product])
    end

    def update
      respond_with Product.update(params[:id], params[:product])
    end

    def destroy
      respond_with Product.destroy(params[:id])
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
