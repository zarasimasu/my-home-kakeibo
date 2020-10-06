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
		if @income.user_id == current_user.id
		else
			redirect_to root_path
		end
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
		@income = Income.find(params[:id])
		if @income.update(income_params)
			redirect_to incomes_path
		else
			render :edit
		end
	end
 
	def destroy
		@income = Income.find(params[:id])
		if @income.destroy
      redirect_to incomes_path
    else
      render :index
    end
	end

	private

	def income_params
		params.require(:income).permit(:income_category_id, :value, :year_month, :description).merge(user_id: current_user.id)
	end
end
