class VariablecostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variablecost, only: [:edit, :update, :destroy]

  def index
    @variablecost = current_user.variablecosts.all.order(id: "DESC")
	end
 
	def show
	end
 
  def new
    @variablecost = Variablecost.new
	end
 
  def edit
    if @variablecost.user_id == current_user.id
		else
			redirect_to root_path
		end
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
    if @variablecost.update(variablecost_params)
			redirect_to variablecosts_path
		else
			render :edit
		end
	end
 
	def destroy
  end
  
  private

	def variablecost_params
		params.require(:variablecost).permit(:variablecost_category_id, :value, :year_month, :description).merge(user_id: current_user.id)
  end
  
  def set_variablecost
		@variablecost = Variablecost.find(params[:id])
	end
end
