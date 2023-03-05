class CreateFarms < ActiveRecord::Migration[7.0]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :location
      t.references :farmer, foreign_key: :true
    end
  end
end
