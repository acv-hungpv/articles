class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :title
      t.integer :like
      t.boolean :published
      t.timestamps 
    end
  end
end
