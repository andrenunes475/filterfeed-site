class CreateGraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :graphs do |t|
      t.string :name
      t.text :product

      t.timestamps
    end
  end
end
