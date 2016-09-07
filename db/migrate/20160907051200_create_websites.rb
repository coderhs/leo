class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :domain
      t.string :status, default: 'PENDING'
      t.json :result

      t.timestamps
    end
  end
end
