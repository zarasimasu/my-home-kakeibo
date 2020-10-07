class VariablecostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @variablecost = current_user.variablecosts.all.order(id: "DESC")
	end
 
	def show
	end
 
  def new
    @variablecost = Variablecost.new
	end
 
	def edit
	end
 
  def create
    @variablecost = Variablecost.new(variablecost_params)
		if @variablecost.save
			redirect_to variablecosts_path
		else
			render :new
		end
	end
 
	def update
	end
 
	def destroy
  end
  
  private

	def variablecost_params
		params.require(:variablecost).permit(:variablecost_category_id, :value, :year_month, :description).merge(user_id: current_user.id)
	end
end
