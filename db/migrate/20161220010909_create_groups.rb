class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :detail
      t.references :user
      t.references :message
      t.timestamps
    end
  end
end
