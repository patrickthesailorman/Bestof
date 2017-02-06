class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :category
      t.string :title
      t.text :content
      t.text :pics, array:true, default:[]
      t.string :link
      t.text :address
      t.decimal :lat, :precision=>13, :scale=>9
      t.decimal :long, :precision=>13, :scale=>9
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
