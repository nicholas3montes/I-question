Rails.application.routes.draw do
  namespace 'api' do
    resources :users, only: [:create]
    resources :question_posts, only: [:create]
    resources :question_responses, only: [:create]
    resources :like_question_post, only: [:create]
    resources :dislike_question_post, only: [:create]
    resources :react_question_post, only: [:index, :destroy]
  end
end
