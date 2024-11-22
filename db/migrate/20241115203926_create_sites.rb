class CreateSites < ActiveRecord::Migration[8.1]
  def change
    create_table :sites do |t|
      t.string :title, null: false

      t.timestamps
    end

    add_index :sites, :title, unique: true
  end
end
