require 'rails_helper'

RSpec.describe Saving, type: :model do
  before do
    @saving = build(:saving)
  end

  describe "バリデーション" do

    it "すべての項目が入力されていれば登録できる" do
      expect(@saving).to be_valid
    end

    it "日付が入力されていなければ登録できない" do
      @saving.day = nil
      @saving.valid?
      expect(@saving.errors.full_messages).to include("Day can't be blank")
    end

    it "金額が入力されていなければ登録できない" do
      @saving.saving = nil
      @saving.valid?
      expect(@saving.errors.full_messages).to include("Saving is invalid", "Saving is not a number", "Saving can't be blank")
    end

    it "金額がマイナスだと登録できない" do
      @saving.saving = -1
      @saving.valid?
      expect(@saving.errors.full_messages).to include("Saving is invalid", "Saving must be greater than or equal to 0")
    end

    it "金額の入力が半角数字以外だと登録できない" do
      @saving.saving = "１００００"
      @saving.valid?
      expect(@saving.errors.full_messages).to include("Saving is not a number")
    end
  end
end
