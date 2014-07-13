json.array!(@sub_lists) do |sub_list|
  json.extract! sub_list, :id, :name, :description
  json.url sub_list_url(sub_list, format: :json)
end
