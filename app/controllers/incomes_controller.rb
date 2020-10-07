class IncomesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_income, only: [:edit, :update, :destroy]

  def index
    @income = current_user.incomes.all.order(id: "DESC")
	end
 
	def show
	end
 
  def new
		@income = Income.new
	end
 
	def edit
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
		if @income.update(income_params)
			redirect_to incomes_path
		else
			render :edit
		end
	end
 
	def destroy
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

	def set_income
		@income = Income.find(params[:id])
	end
end
