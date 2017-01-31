Rails.application.routes.draw do
  root 'main#index'
  get 'data', constraints: { format: 'json' }, to: 'main#data'
end
