# frozen_string_literal: true

# Controller for the home page already made for you
class HomeController < ApplicationController
  # No sign in needed to access these pages
  # Overrides ApplicationController's instructions to check for login by default
  skip_before_action :authenticate_user!

  # Index page (home page)
  def index
  end

  # Viewing requests page
  def search
    @requests = Request.all
  end
  
end
