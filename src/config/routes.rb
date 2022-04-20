# Project name: Pantry Packer
# Description: A single database and network for food pantries to request food items.
# Filename: routes.rb
# Description: Contains the valid routes for navigating the application.
# Last modified on: 4/19/22 

# frozen_string_literal: true

# This file tells the Rails server how incoming requests are sent to which
# controller and method.
#
#
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :requests
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # The root, true homepage of the application.
  root 'home#index'

  # The page for viewing all requests from all pantries.
  get 'home/search'

  # Devise login and account views.
  devise_for :users, :controllers => {registrations: 'users/registrations'}

  # Handles any routing errors gracefully.
  get '*unmatched_route', to: 'application#not_found'

end
