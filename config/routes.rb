Rails.application.routes.draw do

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
