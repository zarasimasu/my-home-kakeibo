class BalancesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @year_month = params[:year_month]
    @income = current_user.incomes.where(year_month: (@year_month + "-01")).pluck(:value)
  end

end
