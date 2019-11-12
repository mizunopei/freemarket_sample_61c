class ChangeDatatypeTitleOfArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :d_date, :string
  end
end
