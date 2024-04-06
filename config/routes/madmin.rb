# Below are the routes for madmin
namespace :madmin do
  resources :cats
  resources :lists
  resources :posts
  resources :tags
  namespace :active_storage do
    resources :attachments
  end
  resources :arts
  namespace :active_storage do
    resources :variant_records
  end
  resources :articles
  resources :users
  resources :taggables
  namespace :active_storage do
    resources :blobs
  end
  namespace :action_text do
    resources :rich_texts
  end
  namespace :action_text do
    resources :encrypted_rich_texts
  end
  root to: "dashboard#show"
end
