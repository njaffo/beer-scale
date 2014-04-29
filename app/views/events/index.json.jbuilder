json.array!(@events) do |event|
  json.extract! event, :id
  json.url keg_url(event, format: :json)
end
