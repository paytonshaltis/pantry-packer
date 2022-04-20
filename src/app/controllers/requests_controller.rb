# Project name: Pantry Packer
# Description: A single database and network for food pantries to request food items.
# Filename: requests_controller.rb
# Description: Logic for the request management pages.
# Last modified on: 4/19/22

# Logic for all of the 'request' pages in the application.
class RequestsController < ApplicationController

  # IMPORTANT: Users should NOT need to be logged in to see the 
  # 'show' page for other accounts. This is the only 'requests' 
  # page that should get this treatment.
  before_action :set_request, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ show ]

  # GET /requests or /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1 or /requests/1.json
  def show

    # Fetch the associated user to display in the detailed request.
    @user = RequestsController.get_associated_user(@request.user_id);

    # Process the location in order to construct the Google Maps URL.
    @processed_location = @user.pantry_location.gsub(" ", "+");

  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests or /requests.json
  # Only change to this method was the updated message.
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to request_url(@request), notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  # Only change to this method was the updated message.
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to request_url(@request), notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  # Only change to this method was the updated message.
  def destroy
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully closed." }
      format.json { head :no_content }
    end
  end

  # Private 'helper' methods for the Requests class logic. These are either
  # used within the class itself or called from the views to configure displays.
  private

    # Identifies the request by its unique identification.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params

      # Updated to permit the user_id parameter for user --> request association.
      params.require(:request).permit(:name, :item_type, :description, :ispositive, :user_id)
    end

    # Create an abbreviated description for the request to fit in the table.
    def self.abbreviate_desc(description)
      result = description.to_s[0..40]
      if description.to_s[41]
        result = result + "..."
      end
      return result
    end  

    # Returns the number of requests for the user_id.
    def self.get_total_requests(user_id)
      count = 0
      requests = Request.all
      requests.each { |request| 
        if request.user_id == user_id
          count += 1
        end
      }
      return count
    end

    # Returns the User object associated with the passed request user_id.
    def self.get_associated_user(user_id)
      return User.where("id = " + user_id.to_s)[0]
    end

end
