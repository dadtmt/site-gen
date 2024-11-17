class CreatePages < ActiveRecord::Migration[8.1]
  def change
    create_table :pages do |t|
      t.references :site, null: false, foreign_key: true
      t.string :type
      t.string :name, null: false
      t.string :anchor

      t.timestamps
    end

    add_index :pages, [ :name, :site_id ], unique: true
    add_index :pages, [ :anchor, :site_id ], unique: true
  end
end
