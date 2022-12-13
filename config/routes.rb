Rails.application.routes.draw do
  resources :questions, only: %i[new create show index] do
    resources :answers, shallow: true
  end

end
