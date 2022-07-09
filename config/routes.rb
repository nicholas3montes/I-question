Rails.application.routes.draw do
  namespace 'api' do
    resources :question_posts, only: [:create]
    resources :question_responses, only: [:create]
    resources :users, only: [:create]
  end
end
