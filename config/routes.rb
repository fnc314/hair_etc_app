HairEtcApp::Application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    resource :appointments, only: [:create]
    get 'appointments', :to => 'appointments#index'
    resource :sessions, only: [:create]
    get 'website/stylists/all', :to => 'website#all_stylists', as: 'all_stylists'
    get 'website/stylist/:first_name', :to => 'website#stylist', as: 'specific_stylist'
    get 'website/offerings/all', :to => 'website#all_offerings', as: 'offerings_list'
  end

  root to: 'home#index'
  
  devise_for :clients

  devise_scope :client do
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end
  
  resources :clients do
    resources :appointments
  end
  
end
#                     Prefix Verb   URI Pattern                                         Controller#Action
#           api_appointments POST   /api/appointments(.:format)                         api/appointments#create {:format=>:json}
#                            GET    /api/appointments(.:format)                         api/appointments#index {:format=>:json}
#               api_sessions POST   /api/sessions(.:format)                             api/sessions#create {:format=>:json}
#           api_all_sytlists GET    /api/website/stylists/all(.:format)                 api/website#all_stylists {:format=>:json}
#       api_specific_stylist GET    /api/website/stylist/:first_name(.:format)          api/website#stylist {:format=>:json}
#         api_offerings_list GET    /api/website/offerings/all(.:format)                api/website#offerings {:format=>:json}
#                       root GET    /                                                   home#index
#         new_client_session GET    /clients/sign_in(.:format)                          devise/sessions#new
#             client_session POST   /clients/sign_in(.:format)                          devise/sessions#create
#     destroy_client_session DELETE /clients/sign_out(.:format)                         devise/sessions#destroy
#            client_password POST   /clients/password(.:format)                         devise/passwords#create
#        new_client_password GET    /clients/password/new(.:format)                     devise/passwords#new
#       edit_client_password GET    /clients/password/edit(.:format)                    devise/passwords#edit
#                            PATCH  /clients/password(.:format)                         devise/passwords#update
#                            PUT    /clients/password(.:format)                         devise/passwords#update
# cancel_client_registration GET    /clients/cancel(.:format)                           devise/registrations#cancel
#        client_registration POST   /clients(.:format)                                  devise/registrations#create
#    new_client_registration GET    /clients/sign_up(.:format)                          devise/registrations#new
#   edit_client_registration GET    /clients/edit(.:format)                             devise/registrations#edit
#                            PATCH  /clients(.:format)                                  devise/registrations#update
#                            PUT    /clients(.:format)                                  devise/registrations#update
#                            DELETE /clients(.:format)                                  devise/registrations#destroy
#                    sign_in GET    /sign_in(.:format)                                  devise/sessions#new
#                   sign_out GET    /sign_out(.:format)                                 devise/sessions#destroy
#        client_appointments GET    /clients/:client_id/appointments(.:format)          appointments#index
#                            POST   /clients/:client_id/appointments(.:format)          appointments#create
#     new_client_appointment GET    /clients/:client_id/appointments/new(.:format)      appointments#new
#    edit_client_appointment GET    /clients/:client_id/appointments/:id/edit(.:format) appointments#edit
#         client_appointment GET    /clients/:client_id/appointments/:id(.:format)      appointments#show
#                            PATCH  /clients/:client_id/appointments/:id(.:format)      appointments#update
#                            PUT    /clients/:client_id/appointments/:id(.:format)      appointments#update
#                            DELETE /clients/:client_id/appointments/:id(.:format)      appointments#destroy
#                    clients GET    /clients(.:format)                                  clients#index
#                            POST   /clients(.:format)                                  clients#create
#                 new_client GET    /clients/new(.:format)                              clients#new
#                edit_client GET    /clients/:id/edit(.:format)                         clients#edit
#                     client GET    /clients/:id(.:format)                              clients#show
#                            PATCH  /clients/:id(.:format)                              clients#update
#                            PUT    /clients/:id(.:format)                              clients#update
#                            DELETE /clients/:id(.:format)                              clients#destroy