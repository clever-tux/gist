class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :gist, index: true
      t.references :user, index: true
      t.text :body

      t.timestamps null: false
    end
  end
end
