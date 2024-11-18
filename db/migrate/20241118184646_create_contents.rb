class CreateContents < ActiveRecord::Migration[8.1]
  def change
    create_table :contents do |t|
      t.references :page, null: false, foreign_key: true
      t.string :position, null: false
      t.string :body
      t.string :type

      t.timestamps
    end
  end
end
