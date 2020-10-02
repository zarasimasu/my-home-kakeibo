class IncomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @income = current_user.incomes.all
	end
 
	def show
	end
 
  def new
    @incom = Income.new
	end
 
	def edit
	end
 
	def create
	end
 
	def update
	end
 
	def destroy
	end
end
