ParasquidCs1899::Application.routes.draw do

  devise_for :users

  get 'members/search'
  resources :members, only: [:index, :show, :update] do
    member do
      get 'challenges'
      get 'payments'
      get 'recommendations'
      match 'recommendations' => 'members#create_recommendations', via: [:post]
    end
  end

  get 'challenges/closed'
  get 'challenges/recent'
  resources :challenges, only: [:index, :create, :show, :update] do
    get 'comments'
    get 'participants'
    post 'survey'
  end

  mount_sextant if Rails.env.development? # https://github.com/schneems/sextant

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, :at => '/'

end
