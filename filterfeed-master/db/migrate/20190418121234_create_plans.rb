class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :content
      t.boolean :active

      t.timestamps
    end
  end
end
