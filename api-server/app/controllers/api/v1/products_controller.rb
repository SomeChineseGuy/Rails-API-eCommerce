class Api::V1::ProductsController < ApplicationController
  respond_to :json
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
end  
