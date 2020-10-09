class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :first_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name, null: false
      t.string :last_name_kana, null: false
      t.date :birth_date, null: false
      t.integer :sex, null: false
      t.timestamps
    end
  end
end
