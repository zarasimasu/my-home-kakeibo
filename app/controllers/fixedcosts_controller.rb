class FixedcostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @fixedcost = current_user.fixedcosts.all.order(id: "DESC")
	end
 
	def show
	end
 
  def new
    @fixedcost = Fixedcost.new
	end
 
	def edit
		@fixedcost = Fixedcost.find(params[:id])
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
	end
 
	def destroy
	end

	private

	def fixedcost_params
		params.require(:fixedcost).permit(:fixedcost_category_id, :value, :year_month, :description).merge(user_id: current_user.id)
	end
end