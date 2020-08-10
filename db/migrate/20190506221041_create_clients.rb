class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :cnpj
      t.string :phone
      t.string :key
      t.text :product
      t.boolean :blocked

      t.timestamps
    end
  end
end
