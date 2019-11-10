require 'rails_helper'

describe User do
  describe '#create' do
    it "ニックネーム、メールアドレス、パスワード（確認含む）、氏名（カナ含む）、誕生日、電話番号が入力されていれば登録できる" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
    it "nicknameが空欄の場合はエラー" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailが空欄の場合はエラー" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailがアドレスのフォーマットどおりでない場合はエラー" do
      user = build(:user, email: "abcdefg.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    it "パスワードが空欄の場合はエラー" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
    it "パスワードが6文字以下の場合はエラー" do
      user = build(:user, password: "1q2w3e")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "パスワードが数字のみの場合はエラー" do
      user = build(:user, password: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
    it "パスワードが英字のみの場合はエラー" do
      user = build(:user, password: "qwertyu")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
    it "パスワードに英数字以外が含まれる場合はエラー" do
      user = build(:user, password: "あいうえ123")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end
    it "パスワード（確認）が空欄の場合はエラー" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end
    it "パスワード（確認）がパスワードと一致しない場合はエラー" do
      user = build(:user, password: "1q2w3e4", password_confirmation: "q2w3e4r")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "last_nameが空欄の場合はエラー" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "first_nameが空欄の場合はエラー" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "last_name_kanaが空欄の場合はエラー" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end
    it "last_name_kanaがひらがなの場合はエラー" do
      user = build(:user, last_name_kana: "じんなんざか")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end
    it "last_name_kanaが漢字の場合はエラー" do
      user = build(:user, last_name_kana: "神南坂")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end
    it "first_name_kanaが空欄の場合はエラー" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "first_name_kanaがひらがなの場合はエラー" do
      user = build(:user, last_name_kana: "いちろう")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end
    it "first_name_kanaが漢字の場合はエラー" do
      user = build(:user, last_name_kana: "一郎")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は不正な値です")
    end
    it "birth_dayが空欄の場合はエラー" do
      user = build(:user, birth_day: "一郎")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    it "telが空欄の場合はエラー" do
      user = build(:user, tel: "")
      user.valid?
      expect(user.errors[:tel]).to include("を入力してください")
    end
    it "telが9文字以下の場合はエラー" do
      user = build(:user, tel: "123456789")
      user.valid?
      expect(user.errors[:tel]).to include("は10文字以上で入力してください")
    end
    it "telが12文字以上の場合はエラー" do
      user = build(:user, tel: "123456789012")
      user.valid?
      expect(user.errors[:tel]).to include("は11文字以内で入力してください")
    end
    it "telが数字以外の場合はエラー" do
      user = build(:user, tel: "abcdefghij")
      user.valid?
      expect(user.errors[:tel]).to include("は数値で入力してください")
    end
  end
end