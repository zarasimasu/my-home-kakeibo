class FixedcostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @fixedcost = current_user.fixedcosts.all
	end
 
	def show
	end
 
	def new
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
