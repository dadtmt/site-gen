class CreatePages < ActiveRecord::Migration[8.1]
  def change
    create_table :pages do |t|
      t.references :site, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
