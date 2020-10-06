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
	end
 
	def create
	end
 
	def update
	end
 
	def destroy
	end
end
