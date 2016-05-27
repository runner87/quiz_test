Rails.application.routes.draw do
  get 'dashboard/index'

  ActiveAdmin.routes(self)
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end
