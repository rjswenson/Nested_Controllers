HowTo::Application.routes.draw do
  root to: 'manifests#index'
  resources :manifests do
    resources :checklists
  end

end

