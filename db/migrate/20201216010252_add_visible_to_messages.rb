class AddVisibleToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :visible, :boolean, default: true

    add_index :messages, :visible
  end
end
