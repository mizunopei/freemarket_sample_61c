require 'rails_helper'

describe Address do
  describe '#create' do
    it "氏名（カナ含む）、郵便番号、都道府県、市町村、番地、建物名、電話番号が入力されていれば登録できる" do
      user = create(:user)
      address = build(:address, user_id: user.id)
      address.valid?
      expect(address).to be_valid
    end
    it "建物名と電話番号が入力されていなくても登録できる" do
      user = create(:user)
      address = build(:address, building_name: nil, building_tel: nil, user_id: user.id)
      address.valid?
      expect(address).to be_valid
    end
    it "d_last_nameが空欄の場合はエラー" do
      address = build(:address, d_last_name: "")
      address.valid?
      expect(address.errors[:d_last_name]).to include("を入力してください")
    end
    it "d_first_nameが空欄の場合はエラー" do
      address = build(:address, d_first_name: "")
      address.valid?
      expect(address.errors[:d_first_name]).to include("を入力してください")
    end
    it "d_last_name_kanaが空欄の場合はエラー" do
      address = build(:address, d_last_name_kana: "")
      address.valid?
      expect(address.errors[:d_last_name_kana]).to include("を入力してください")
    end
    it "d_last_name_kanaがひらがなの場合はエラー" do
      address = build(:address, d_last_name_kana: "じんなんざか")
      address.valid?
      expect(address.errors[:d_last_name_kana]).to include("は不正な値です")
    end
    it "d_last_name_kanaが漢字の場合はエラー" do
      address = build(:address, d_last_name_kana: "神南坂")
      address.valid?
      expect(address.errors[:d_last_name_kana]).to include("は不正な値です")
    end
    it "d_first_name_kanaが空欄の場合はエラー" do
      address = build(:address, d_first_name_kana: "")
      address.valid?
      expect(address.errors[:d_first_name_kana]).to include("を入力してください")
    end
    it "d_first_name_kanaがひらがなの場合はエラー" do
      address = build(:address, d_last_name_kana: "いちろう")
      address.valid?
      expect(address.errors[:d_last_name_kana]).to include("は不正な値です")
    end
    it "d_first_name_kanaが漢字の場合はエラー" do
      address = build(:address, d_last_name_kana: "一郎")
      address.valid?
      expect(address.errors[:d_last_name_kana]).to include("は不正な値です")
    end 
    it "postal_codeが空欄の場合はエラー" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end
    it "postal_codeが6文字以下の場合はエラー" do
      address = build(:address, postal_code: "123456")
      address.valid?
      expect(address.errors[:postal_code]).to include("は7文字で入力してください")
    end
    it "postal_codeが8文字以上の場合はエラー" do
      address = build(:address, postal_code: "12345678")
      address.valid?
      expect(address.errors[:postal_code]).to include("は7文字で入力してください")
    end
    it "postal_codeが数字以外の場合はエラー" do
      address = build(:address, postal_code: "abcdefg")
      address.valid?
      expect(address.errors[:postal_code]).to include("は数値で入力してください")
    end
    it "cityが空欄の場合はエラー" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end
    it "addressが空欄の場合はエラー" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end
    it "building_telが9文字以下の場合はエラー" do
      address = build(:address, building_tel: "123456789")
      address.valid?
      expect(address.errors[:building_tel]).to include("は10文字以上で入力してください")
    end
    it "building_telが12文字以上の場合はエラー" do
      address = build(:address, building_tel: "123456789012")
      address.valid?
      expect(address.errors[:building_tel]).to include("は11文字以内で入力してください")
    end
    it "building_telが数字以外の場合はエラー" do
      address = build(:address, building_tel: "abcdefghij")
      address.valid?
      expect(address.errors[:building_tel]).to include("は数値で入力してください")
    end
  end
end