class CategoriesController < InheritedResources::Base

  # before_filter :restrict_access

  def index
  	@categories = Category.all
  	render json: @categories
  end

  private

    def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end

    def category_params
      params.require(:category).permit(:name, :price, :quantity, :category_id)
    end
  end
end

