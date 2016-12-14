Rails.application.routes.draw do
  root 'publications#index'
  devise_for :users,  controllers: { sessions: 'users/sessions' }
  resources :publications do
    collection do
      post 'search', to: 'publications#index'
    end
  end
  get '*path' => redirect('/')
end
