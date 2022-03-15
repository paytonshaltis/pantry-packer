json.extract! request, :id, :date_added, :name, :type, :description, :ispositive, :created_at, :updated_at
json.url request_url(request, format: :json)
