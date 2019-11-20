crumb :root do
  link "メルカリ", root_path
end

#マイページ
crumb :users do
  link "マイページ", users_path
end

#プロフィール
crumb :profile do
  link "プロフィール", profile_users_path
  parent :users
end

#出品中
crumb :exhibit do
  link "出品した商品-出品中", exhibit_users_path
  parent :users
end

#支払い方法
crumb :card do
  link "支払い方法", card_users_path
  parent :users
end

#本人情報
crumb :personal do
  link "本人情報", personal_users_path
  parent :users
end

#ログアウト
crumb :logout do
  link "ログアウト",  logout_users_path
  parent :users
end

#商品詳細
crumb :show_item do |item|
  link item.name, item_path
  parent :root
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).