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
	end
 
	def update
	end
 
	def destroy
	end
end
