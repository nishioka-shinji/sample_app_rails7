namespace 'sample' do
  resource :chartkick, only: :show, controller: :chartkick
  resources :jobs, only: [:index, :create]
end