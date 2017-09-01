Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # http请求方法 请求url ==> 请求控制包文件#请求控制包中定义的方法名
  root :to => "welcome#index"
  # 设定URL路由规则的档案，scaffold在此新增一行
  resources :people, :articles
  resources :articles do
    resources :comments
  end
  get "welcome/say_hello" => "welcome#say"
  get "welcome" => "welcome#index"

  get "article/new" => "new"

  # match ':controller(/:action(/:id(.:format)))', via: :all
end
