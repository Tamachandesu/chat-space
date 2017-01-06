class RemoveDetailFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :detail, :text
  end
end
