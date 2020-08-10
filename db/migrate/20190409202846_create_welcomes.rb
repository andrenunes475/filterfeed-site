class CreateWelcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :welcomes do |t|
      t.text :content
      t.boolean :active

      t.timestamps
    end
  end
end
