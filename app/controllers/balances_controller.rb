class BalancesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @year_month = params[:year_month]

    @incomes = current_user.incomes.where(year_month: (@year_month + "-01"))

    @income = current_user.incomes.where(year_month: (@year_month + "-01")).pluck(:value)
    @income_total = 0
    @income.each do |income|
      @income_total += income
    end

    @fixedcosts = current_user.fixedcosts.where(year_month: (@year_month + "-01"))

    @fixedcost = current_user.fixedcosts.where(year_month: (@year_month + "-01")).pluck(:value)
    @fixedcost_total = 0
    @fixedcost.each do |fixedcost|
      @fixedcost_total += fixedcost
    end

    @variablecosts = current_user.variablecosts.where(year_month: (@year_month + "-01"))

    @variablecost = current_user.variablecosts.where(year_month: (@year_month + "-01")).pluck(:value)
    @variablecost_total = 0
    @variablecost.each do |variablecost|
      @variablecost_total += variablecost
    end

    @balance = @income_total - (@fixedcost_total + @variablecost_total)
  end
end
