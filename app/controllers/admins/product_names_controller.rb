class Admins::ProductNamesController < Admins::ApplicationController

  def new
  	@product_name = ProductName.new
  end

  def create
    @product_name = ProductName.new
  	product_name = ProductName.new(product_name_params)
  	if product_name.save
      redirect_to admins_homes_path
    else
      flash.now[:admins_error] = "空白では登録できません"
      render'new'
    end
  end

private
    def product_name_params
      params.require(:product_name).permit(:product_name)
    end
end
