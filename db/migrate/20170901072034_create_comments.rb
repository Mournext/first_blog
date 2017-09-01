class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      #t.references 这行代码创建 article_id 整数字段，
      # 为这个字段建立索引，并建立指向 articles 表的 id 字段的外键约束。
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
