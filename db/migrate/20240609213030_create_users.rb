class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
