require 'rails_helper'

describe SnsCredential, type: :model do
  describe '#create' do

  before do
    user = create(:user, id: 1)
  end

    it "uid, provider, user_idがあれば登録できる" do
      sns = build(:sns_credential)
      expect(sns).to be_valid
    end
    it "uidが空欄の場合はエラー" do
      sns = build(:sns_credential, uid: nil)
      sns.valid?
      expect(sns.errors[:uid]).to include("を入力してください")
    end
    it "providerが空欄の場合はエラー" do
      sns = build(:sns_credential, provider: nil)
      sns.valid?
      expect(sns.errors[:provider]).to include("を入力してください")
    end
    it "user_idが空欄の場合はエラー" do
      sns = build(:sns_credential, user_id: nil)
      sns.valid?
      expect(sns.errors[:user_id]).to include("を入力してください")
    end
    it "uidが重複している場合はエラー" do
      sns1 = create(:sns_credential)
      sns2 = build(:sns_credential)
      sns2.valid?
      expect(sns2.errors[:uid]).to include("既に存在しています")
    end
  end
  
end