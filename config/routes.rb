Rails.application.routes.draw do
  namespace :backoffice do
    root to: 'backoffice#index'
    resources :users, path: "administrators"
    resources :clients, path: "customers"
    resources :welcomes, path: "products_text"
    resources :graphs, path: "landing_page"
    resources :partners
    resources :plans
    resources :contact_infos, path: "contact"
    resources :addresses
    resources :members, path: "staff"
    resources :services, path: "products"
    resources :another_services, path: "staff_text"
    get '/dashboard', to: redirect('/backoffice'), as: 'redirect'
    post '/dashboard', to: 'backoffice#dashboard', as: 'dashboard'
  end

  namespace :backoffice do
    post '/clients/:id/block', to: 'clients#block', as: 'client_block'
    post '/welcomes/:id/activate', to: 'welcomes#activate', as: 'welcome_activate'
    post '/graphs/:id/activate', to: 'graphs#activate', as: 'graph_activate'
    post '/partners/:id/activate', to: 'partners#activate' , as: 'partner_activate'
    post '/plans/:id/activate', to: 'plans#activate', as: 'plan_activate'
    post '/contact_infos/:id/activate', to: 'contact_infos#activate', as: 'contact_info_activate'
    post '/addresses/:id/activate', to: 'addresses#activate', as: 'address_activate'
  end

  resources :dashboard, only: [:show]
  get '/dashboard', to: redirect('/')
  post '/dashboard/:id', to: 'dashboard#auth', as: 'dashboard_auth'
  get '/dashboard/:id/authentication_failed', to: 'dashboard#authentication_failed', as: 'dashboard_authentication_failed'

  devise_for :users

  get '/example', to: 'dashboard#example', as: 'dashboard_example'

  resources :contacts, only: [:create]

  root to: 'home#index'
  get '/curso', to: 'home#page2', as: 'home_curso'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
