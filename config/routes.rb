# http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'welcome#index'
  get  'welcome/index'

  resources :posts
end
