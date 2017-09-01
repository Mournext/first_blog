class Event < ApplicationRecord #::Base
  # model层的数据，进行验证信息管理
  validates_presence_of :name #name 字段必填项
end
