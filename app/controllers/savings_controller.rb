class SavingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @savings = current_user.savings.all
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

  private

	def saving_params
		params.require(:saving).permit(:saving, :day).merge(user_id: current_user.id)
	end
end
