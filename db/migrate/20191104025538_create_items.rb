class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string            :name, null: false
      t.text              :introduction, null: false
      t.string            :condition
      t.string            :d_burden
      t.string            :d_way
      t.references        :prefecture
      t.integer           :d_date
      t.integer           :price
      t.timestamps
    end
  end
end
