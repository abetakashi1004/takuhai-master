Rails.application.routes.draw do

  namespace :publics do
    get 'deliveries/index'
  end
  namespace :publics do
    get 'endusers/show'
    get 'endusers/edit'
  end
  namespace :publics do
    get 'change_dates/new'
  end
  namespace :publics do
    get 'redeliveries/new'
  end
  namespace :publics do
    get 'homes/index'
    get 'homes/about'
    get 'homes/plus'
  end
  namespace :drivers do
    get 'delivery_people/show'
  end
  namespace :drivers do
    get 'packages/show'
  end
  namespace :drivers do
    get 'takeouts/new'
    get 'takeouts/index'
    get 'takeouts/complete'
  end
  namespace :drivers do
    get 'deliveries/new'
  end
  namespace :drivers do
    get 'today_courses/new'
  end
  namespace :admins do
    get 'product_names/new'
  end
  namespace :admins do
    get 'shippers/new'
  end
  namespace :admins do
    get 'packages/new'
    get 'packages/index'
    get 'packages/show'
    get 'packages/edit'
  end
  namespace :admins do
    get 'homes/index'
  end
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
