json.extract! request, :id, :name, :item_type, :description, :ispositive, :created_at, :updated_at
json.url request_url(request, format: :json)
