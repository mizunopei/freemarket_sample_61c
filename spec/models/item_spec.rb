require "rails_helper"

describe Item do
  describe "#create" do
    it "商品名、商品の説明、商品の状態、配送料の負担、配送の方法、発送元の地域、発送までの日数、販売価格が入力されていれば登録できる" do
      user = create(:user)
      item = build(:item, user_id: user.id)
      expect(item).to be_valid
    end

    it "商品名が空欄の場合はエラー" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "商品名が40文字以上の場合はエラー" do
      item = build(:item, name:"abcdefghijklmnopqrstuvwxyzabcdefghjiklmnopqrstuvwxyz")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "商品の説明が無い場合はエラー" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end

    it "商品の説明が1000文字以上の場合はエラー" do
      item = build(:item, introduction: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
    end

  it "商品の状態が空欄の場合はエラー" do
    item =  build(:item, condition: nil)
    item.valid?
    expect(item.errors[:condition]).to include("を入力してください")
  end

  it "配送料の負担が空欄の場合はエラー" do
    item = build(:item, d_burden: nil)
    item.valid?
    expect(item.errors[:d_burden]).to include("を入力してください")
  end
  
  it "配送の方法が空欄の場合はエラー" do
    item = build(:item, d_way: nil)
    item.valid?
    expect(item.errors[:d_way]).to include("を入力してください")
  end

  it "発送元の地域が空欄の場合はエラー" do
    item = build(:item, prefecture_id: nil)
    item.valid?
    expect(item.errors[:prefecture_id]).to include("を入力してください")
  end

  it "発送までの日数が空欄の場合はエラー" do
    item = build(:item, d_date: nil)
    item.valid?
    expect(item.errors[:d_date]). to include("を入力してください")
  end

  it "価格が空欄の場合はエラー" do
    item = build(:item, price: nil)
    item.valid?
    expect(item.errors[:price]).to include("300〜9,999,999の値で入力してください")
  end


  end

end