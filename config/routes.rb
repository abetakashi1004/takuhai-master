
Rails.application.routes.draw do

  root 'publics/homes#index'

  devise_for :delivery_people, controllers: {
  sessions:      'drivers/sessions',
  passwords:     'drivers/passwords',
  registrations: 'drivers/registrations'
}
  devise_for :sales_offices, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :endusers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}
  scope module: :publics do
    resources :deliveries, only: [:index]
    resources :endusers, only:[:show, :edit, :update, :destroy]
    resources :change_dates, only:[:new, :create]
    resources :redeliveries, only:[:new, :create]
    resources :homes, only:[:index]
    get 'homes/about'
    get 'homes/plus'
  end

  namespace :drivers do
    resources :delivery_people, only:[:show]
    resources :packages, only:[:show]
    resources :takeouts,only:[:new, :create, :index, :update]
    get 'takeouts/complete'
    resources :deliveries, only:[:new, :create, :destroy]
    resources :today_courses,only:[:new, :create]
  end

  namespace :admins do
    resources :delivery_people, only:[:index, :show, :edit, :update, :destroy]
    resources :product_names, only:[:new, :create]
    resources :shippers, only:[:new, :create]
    resources :packages,only:[:new, :create, :index, :show, :edit, :update, :destroy]
    resources :homes, only:[:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
