require 'rails_helper'

feature '商品購入', type: :feature do
  let(:user) {create(:user)}
  let(:card) {create(:card, user_id: user.id)}
  let(:buyer) {create(:user, id: "2", email: "buyer@buyer.com", tel: "11111111111")}
  let(:item) {create(:item, user: buyer)}
  
  scenario '未ログイン時に購入ボタンを押すとログインページに遷移' do
    visit item_path(item)
    find('a[class="item-buy-btn"]').click
    expect(current_path).to eq new_user_session_path
  end

end