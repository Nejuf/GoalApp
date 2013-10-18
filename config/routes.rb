GoalsApp::Application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :goals

  put "/goals/:id/toggle", :to => "goals#toggle_private", :as => :toggle_goal
  put "/goals/:id/toggle_done", :to => "goals#toggle_done", :as => :done_goal
end
