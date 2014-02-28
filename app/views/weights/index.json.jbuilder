json.array!(@weights) do |weight|
  json.extract! weight, :id, :raw
  json.url weight_url(weight, format: :json)
end
