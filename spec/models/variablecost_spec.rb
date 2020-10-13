require 'rails_helper'

RSpec.describe Variablecost, type: :model do
  before do
    @variablecost = build(:variablecost)
  end

  describe "バリデーション" do

    it "すべての項目が入力されていれば登録できる" do
      expect(@variablecost).to be_valid
    end

    it "備考が入力されていなくても登録できる" do
      @variablecost.description = ""
      expect(@variablecost).to be_valid
    end

    it "カテゴリーが--(idが1)だと登録できない" do
      @variablecost.variablecost_category_id = 1
      @variablecost.valid?
      expect(@variablecost.errors.full_messages).to include("Variablecost category must be other than 1")
    end

    it "年月が空だと登録できない" do
      @variablecost.year_month = nil
      @variablecost.valid?
      expect(@variablecost.errors.full_messages).to include("Year month can't be blank")
    end

    it "金額が空だと登録できない" do
      @variablecost.value = nil
      @variablecost.valid?
      expect(@variablecost.errors.full_messages).to include("Value is invalid", "Value can't be blank")
    end

    it "金額が半角数字以外だと登録できない" do
      @variablecost.value = "１２３４"
      @variablecost.valid?
      expect(@variablecost.errors.full_messages).to include("Value is not a number")
    end

    it "金額が0だと登録できない" do
      @variablecost.value = 0
      @variablecost.valid?
      expect(@variablecost.errors.full_messages).to include("Value must be greater than or equal to 1")
    end
  end
end
