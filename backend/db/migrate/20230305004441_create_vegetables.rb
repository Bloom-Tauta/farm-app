class CreateVegetables < ActiveRecord::Migration[7.0]
  def change
    create_table :vegetables do |t|
      t.string :name
      t.string :description
      t.string :review
      t.references :farm, foreign_key: :true
      t.references :farmer, foreign_key: :true
    end
  end
end
