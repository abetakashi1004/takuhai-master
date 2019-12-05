class Admins::ProductNamesController < ApplicationController

  def new
  	@product_name = ProductName.new
  end

  def create
  	product_name = ProductName.new(product_name_params)
  	product_name.save
  	redirect_to admins_homes_path
  end

private
    def product_name_params
      params.require(:product_name).permit(:product_name)
    end
end
