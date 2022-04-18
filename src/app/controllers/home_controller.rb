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

    # Store the parameters passed from the search field of the view.
    search_text = params[:search_text];
    @canned_good_checked = params[:canned_good_id] ? true : false;
    @fruit_checked = params[:fruit_id] ? true : false;
    @vegetable_checked = params[:vegetable_id] ? true : false;
    @grain_checked = params[:grain_id] ? true : false;
    @protein_checked = params[:protein_id] ? true : false;
    @dairy_checked = params[:dairy_id] ? true : false;
    @meat_checked = params[:meat_id] ? true : false;
    @other_checked = params[:other_id] ? true : false;
    @positive_checked = params[:positive_id] ? true : false;
    @negative_checked = params[:negative_id] ? true : false;

    # First, query requests by 

  end
  
end
