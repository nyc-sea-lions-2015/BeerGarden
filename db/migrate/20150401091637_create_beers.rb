class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name, null: false, unique: true
      t.string :category, null: false
      t.decimal :alc_percent, null: false
      t.string :description
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
