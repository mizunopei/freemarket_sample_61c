require 'rails_helper'

feature 'ログイン', type: :feature do
  let(:user){create:user}

  scenario 'ログイン前はマイページがない' do
    visit root_path
    expect(page).to have_content('新規会員登録')
    expect(page).to have_content('ログイン')
    expect(page).to have_no_content('マイページ')  
  end

  scenario 'ログイン後はマイページがある' do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_no_content('新規会員登録')
    expect(page).to have_content('マイページ')  
  end

end