class DishesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_dish


	def index
		@dishes = Dish.all.includes(:user)
	end

	def home
		@dish_types = ["Italian","Thailand","Indian"]
		@dish_types = [params[:search]] if @dish_types.include?(params[:search])
	end

	def new

	end

	def create
		@dish = Dish.create(dish_params)
		@dish.user_id = params[:user_id]
		@dish.save
		UserMailer.info_email(@user_email,"created").deliver!
		redirect_to dishes_path
		flash[:notice] ="Dish has been created successfully"
		
	end

	def destroy
		@dish.destroy
		UserMailer.info_email(@user_email, "deleted").deliver!
		redirect_to dishes_path
		flash[:notice] ="Dish has been deleted successfully"
	end

	private

	def set_dish
    	@dish = params[:id].blank? ? Dish.new : Dish.find_by_id(params[:id])  
	end

	def dish_params
		params.require(:dish).permit(:user_id,:dish_type,:recipe_type,:user_group)
	end

end
