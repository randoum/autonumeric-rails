Dummy::Application.routes.draw do
  resources :records, only: [:create, :update]

  get '/through_form_helper', to: 'forms#through_form_helper'
  get '/through_form_helper/:id', to: 'forms#through_form_helper_with_record'

  get '/dynamic_field', to: 'forms#dynamic_field'
  get '/dynamic_field/:id', to: 'forms#dynamic_field_with_record'
end
