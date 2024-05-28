Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'str_calculate/add', to: 'str_calculate#add'

end
