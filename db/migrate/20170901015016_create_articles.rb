class CreateArticles < ActiveRecord::Migration[5.1]
  def change #迁移会调用的方法
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
