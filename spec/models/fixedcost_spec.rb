require 'rails_helper'

RSpec.describe Fixedcost, type: :model do
  before do
    @fixedcost = build(:fixedcost)
  end

  describe "バリデーション" do

    it "すべての項目が入力されていれば登録できる" do
      expect(@fixedcost).to be_valid
    end

    it "備考が入力されていなくても登録できる" do
      @fixedcost.description = ""
      expect(@fixedcost).to be_valid
    end

    it "カテゴリーが--(idが1)だと登録できない" do
      @fixedcost.fixedcost_category_id = 1
      @fixedcost.valid?
      expect(@fixedcost.errors.full_messages).to include("Fixedcost category must be other than 1")
    end

    it "年月が空だと登録できない" do
      @fixedcost.year_month = nil
      @fixedcost.valid?
      expect(@fixedcost.errors.full_messages).to include("Year month can't be blank")
    end

    it "金額が空だと登録できない" do
      @fixedcost.value = nil
      @fixedcost.valid?
      expect(@fixedcost.errors.full_messages).to include("Value is invalid", "Value can't be blank")
    end

    it "金額が半角数字以外だと登録できない" do
      @fixedcost.value = "１２３４"
      @fixedcost.valid?
      expect(@fixedcost.errors.full_messages).to include("Value is not a number")
    end

    it "金額が0だと登録できない" do
      @fixedcost.value = 0
      @fixedcost.valid?
      expect(@fixedcost.errors.full_messages).to include("Value must be greater than or equal to 1")
    end
  end
end
