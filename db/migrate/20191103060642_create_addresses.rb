class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :d_last_name,       null: false
      t.string     :d_first_name,      null: false
      t.string     :d_last_name_kana,  null: false
      t.string     :d_first_name_kana, null: false
      t.integer    :postal_code,       null: false
      t.string     :area,              null: false
      t.string     :city,              null: false
      t.string     :address,           null: false
      t.string     :building_name
      t.bigint     :building_tel
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
