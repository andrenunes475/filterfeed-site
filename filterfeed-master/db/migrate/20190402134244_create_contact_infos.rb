class CreateContactInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_infos do |t|
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
