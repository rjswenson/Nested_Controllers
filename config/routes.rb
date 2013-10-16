HowTo::Application.routes.draw do

  resources :manifests do
    resources :checklists
  end

end

