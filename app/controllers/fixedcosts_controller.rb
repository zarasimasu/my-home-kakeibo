class FixedcostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_fixedcost, only: [:edit, :update, :destroy]

  def index
    @fixedcost = current_user.fixedcosts.all.order(id: "DESC")
	end
 
	def show
	end
 
  def new
    @fixedcost = Fixedcost.new
	end
 
	def edit
		if @fixedcost.user_id == current_user.id
		else
			redirect_to root_path
		end
	end
 
	def create
		@fixedcost = Fixedcost.new(fixedcost_params)
		if @fixedcost.save
			redirect_to fixedcosts_path
		else
			render :new
		end
	end
 
	def update
		if @fixedcost.update(fixedcost_params)
			redirect_to fixedcosts_path
		else
			render :edit
		end
	end
 
	def destroy
		if @fixedcost.destroy
      redirect_to fixedcosts_path
    else
      render :index
    end
	end

	private

	def fixedcost_params
		params.require(:fixedcost).permit(:fixedcost_category_id, :value, :year_month, :description).merge(user_id: current_user.id)
	end

	def set_fixedcost
		@fixedcost = Fixedcost.find(params[:id])
	end
end
