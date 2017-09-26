Rails.application.routes.draw do
  # root
  root to: 'messages#index'

  resources :messages
=begin  
  # Create Read Update Delete
  get 'messages/:id', to: 'messages#show'
  post 'messages', to: 'messages#create'
  put 'messages/:id', to: 'messages#update'
  delete 'messages/:id', to: 'messages#destroy'
  
  # messages -> messages#index 一覧ページ
  get 'messages', to: 'messages#index'
  
  # messages/new -> messages#new　新規作成時のページ　-> create
  get 'messages/new', to: 'messages#new'
  
  # messages/:id/edit -> 'messages#edit'　更新時のページ -> update
  get 'messages/:id/edit', to: 'messages#edit'
=end

end
