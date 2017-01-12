class CreateDummies < ActiveRecord::Migration
  def change
    create_table :dummies do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
