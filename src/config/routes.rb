# frozen_string_literal: true

# This file tells the Rails server how incoming requests are sent to which
# controller and method.
#
#
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # The root, true homepage of the application.
  root 'home#index'

  # The page for viewing all requests from all pantries.
  get 'home/view_requests'

  # Devise login and account views.
  devise_for :users

end
