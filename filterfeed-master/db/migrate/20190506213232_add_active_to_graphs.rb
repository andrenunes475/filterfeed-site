class AddActiveToGraphs < ActiveRecord::Migration[5.2]
  def change
    add_column :graphs, :active, :boolean
  end
end
