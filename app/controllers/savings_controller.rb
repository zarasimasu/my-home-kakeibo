class SavingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @savings = current_user.savings.all
  end

  def new
    @saving = Saving.new
  end

  def create
  end

end
