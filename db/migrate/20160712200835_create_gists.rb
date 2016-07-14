class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.references :user, index: true
      t.string :description

      t.timestamps null: false
    end
  end
end
