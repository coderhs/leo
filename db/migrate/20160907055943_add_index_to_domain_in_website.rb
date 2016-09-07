class AddIndexToDomainInWebsite < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :key, :string, null: false
    add_index :websites, :key
  end
end
