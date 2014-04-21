Dummy::Application.routes.draw do
  resources :records, only: [:create, :update]

  get '/static_fields', to: 'forms#static_fields'
  get '/static_fields/:id', to: 'forms#static_fields_with_record'

  get '/javascript_fields', to: 'forms#javascript_fields'
  get '/javascript_fields/:id', to: 'forms#javascript_fields_with_record'

  get '/ajax_fields', to: 'forms#ajax_fields'
  get '/ajax_fields/:id', to: 'forms#ajax_fields_with_record'

  get '/get_content_from_ajax', to: 'forms#get_content_from_ajax'
  get '/get_content_from_ajax/:id', to: 'forms#get_content_from_ajax_with_record'
end
