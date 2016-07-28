class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :preferences

      t.timestamps null: false
    end
  end
end
