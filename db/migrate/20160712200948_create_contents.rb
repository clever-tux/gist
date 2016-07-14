class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :gist, index: true
      t.string :name
      t.text :value

      t.timestamps null: false
    end
    add_foreign_key :contents, :gists
  end
end
