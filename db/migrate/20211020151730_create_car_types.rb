class CreateCarTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :car_types do |t|
      t.string :make
      t.string :model
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
