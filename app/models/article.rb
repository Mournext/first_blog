class Article < ApplicationRecord

  #这两行声明能够启用一些自动行为。例如，如果 @article 实例变量表示一篇文章，
  #就可以使用 @article.comments 以数组形式取回这篇文章的所有评论。
  # 为article声明有外键关联  以及依赖的数据删除
  has_many :comments, dependent: :destroy
  # 设置对article的title字段的验证设置
  validates :title, presence: true,
                    length: {minimum: 5 }
end
