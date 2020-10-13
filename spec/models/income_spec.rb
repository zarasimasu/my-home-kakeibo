require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    @income = build(:income)
  end

  describe "バリデーション" do

    it "すべての項目が入力されていれば登録できる" do
      expect(@income).to be_valid
    end

    it "備考が入力されていなくても登録できる" do
      @income.description = ""
      expect(@income).to be_valid
    end

    it "カテゴリーが--(idが1)だと登録できない" do
      @income.income_category_id = 1
      @income.valid?
      expect(@income.errors.full_messages).to include("Income category must be other than 1")
    end

    it "年月が空だと登録できない" do
      @income.year_month = nil
      @income.valid?
      expect(@income.errors.full_messages).to include("Year month can't be blank")
    end

    it "金額が空だと登録できない" do
      @income.value = nil
      @income.valid?
      expect(@income.errors.full_messages).to include("Value is invalid", "Value can't be blank")
    end

    it "金額が半角数字以外だと登録できない" do
      @income.value = "１２３４"
      @income.valid?
      expect(@income.errors.full_messages).to include("Value is not a number")
    end

    it "金額が0だと登録できない" do
      @income.value = 0
      @income.valid?
      expect(@income.errors.full_messages).to include("Value must be greater than or equal to 1")
    end
  end
end
