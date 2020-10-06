class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @income = current_user.incomes.all
	end
 
	def show
	end
 
  def new
		@income = Income.new
	end
 
	def edit
		@income = Income.find(params[:id])
	end
 
	def create
		@income = Income.new(income_params)
		if @income.save
			redirect_to incomes_path
		else
			render :new
		end
	end
 
	def update
	end
 
	def destroy
	end

	private

	def income_params
		params.require(:income).permit(:income_category_id, :value, :year_month, :description).merge(user_id: current_user.id)
	end
end
