class AddSourcesToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :sources, :text
  end
end
