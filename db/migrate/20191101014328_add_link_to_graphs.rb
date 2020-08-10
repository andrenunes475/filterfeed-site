class AddLinkToGraphs < ActiveRecord::Migration[5.2]
  def change
    add_column :graphs, :link, :text, default: nil
  end
end
