class SavingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saving, only: [:edit, :update, :destroy]


  def index
    @savings = current_user.savings.all.order(id: "DESC")
    @saving = current_user.savings.last(1).pluck(:saving)
  end

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new(saving_params)
    if @saving.save
      redirect_to savings_path
    else
      render :new
    end
  end

  def edit
		if @saving.user_id == current_user.id
		else
			redirect_to root_path
		end
  end
  
  def update
		if @saving.update(saving_params)
			redirect_to savings_path
		else
			render :edit
		end
	end

  def destroy
		if @saving.destroy
      redirect_to savings_path
    else
      render :index
    end
	end

  private

	def saving_params
		params.require(:saving).permit(:saving, :day).merge(user_id: current_user.id)
  end
  
  def set_saving
		@saving = Saving.find(params[:id])
	end
end
