json.array!(@items) do |item|
  json.extract! item, :text
  json.url item_url(item, format: :json)
end