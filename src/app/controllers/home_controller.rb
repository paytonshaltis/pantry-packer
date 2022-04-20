# Project name: Pantry Packer
# Description: A single database and network for food pantries to request food items.
# Filename: home_controller.rb
# Description: Logic for the home and search pages.
# Last modified on: 4/19/22

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
    @requests_to_display = Request.all;

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

    # Start by validating / cleansing input if the user entered a string.
    # Downcase it and strip whitespace; replace semicolons to prevent injection.
    query_text = '';
    if search_text
      query_text = search_text;
      query_text = query_text.downcase();
      query_text = query_text.strip();
      query_text = query_text.gsub(/;/, '');
    end

    # Need to query for requests matching: 
    # (1) request name            # (3) item type
    # (2) request description
    request_matches = Request.where("lower(name) LIKE ?", "%#{query_text}%") | 
                      Request.where("lower(description) LIKE ?", "%#{query_text}%") |
                      Request.where("lower(item_type) LIKE ?", "%#{query_text}%");

    # Need to query for pantries matching: 
    # (1) pantry name             # (3) pantry description   
    # (2) pantry location         # (4) pantry link
    user_matches  = User.where("lower(pantry_name) LIKE ?", "%#{query_text}%") | 
                    User.where("lower(pantry_location) LIKE ?", "%#{query_text}%") | 
                    User.where("lower(pantry_link) LIKE ?", "%#{query_text}%") | 
                    User.where("lower(pantry_desc) LIKE ?", "%#{query_text}%");

    # From the matching users, store all requests associated with their IDs.
    matching_ids = [];
    user_matches.each { |user|
      matching_ids.push(user.id);
      puts user.id;
    }

    # Retrieve all requests with a matching user_id.
    associated_requests = [];
    matching_ids.each { |user_id|
      Request.where("user_id=#{user_id}").each { |request| 
        associated_requests.push(request);
      } 
    }

    # Merge the request matches and requests from user matches.
    all_search_results = (request_matches + associated_requests).uniq();

    # Fill the array of allowed food types.
    allowed_food_types = [];
    all_food_types = [:canned_good_id, :fruit_id, :vegetable_id, :grain_id, :protein_id, :dairy_id, :meat_id, :other_id];
    all_food_types.each { |type|
      allowed_food_types.push(params[type]) if params[type];
    }

    # Fill the array of allowed request types.
    allowed_request_types = [];
    all_request_types = [:positive_id, :negative_id];
    all_request_types.each { |type|
      allowed_request_types.push(params[type]) if params[type];
    }

    # Filter the requests by the checkbox options to be displayed.
    marked_for_removal = [];
    all_search_results.each { |request|
      
      # Make sure the request contains at least one checked food type.
      if !allowed_food_types.empty?() && !(allowed_food_types.include?(request.item_type.downcase()))
        marked_for_removal.push(request);
        puts request.item_type + " IS NOT IN " + allowed_food_types.to_s();
        puts "MARKED " + request.to_s();
      end

      # Make sure the request matches one of the request types.
      if !allowed_request_types.empty?() && !((allowed_request_types.include?("positive") && request.ispositive.to_s() == "true") || (allowed_request_types.include?("negative") && request.ispositive.to_s() == "false"))
        marked_for_removal.push(request);
        puts request.ispositive.to_s() + " IS NOT IN " + allowed_request_types.to_s();
        puts "MARKED " + request.to_s();
      end
    }

    # Remove the marked requests.
    marked_for_removal.each { |marked|
      all_search_results.delete(marked);
      puts "REMOVED " + marked.to_s();
    }

    # The list of requests is now ready to be displayed.
    @requests_to_display = all_search_results;

  end
  
end
