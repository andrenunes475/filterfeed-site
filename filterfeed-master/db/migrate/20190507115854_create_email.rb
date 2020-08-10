class CreateEmail < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :address
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
