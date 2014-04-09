json.array!(@kegs) do |keg|
  json.extract! keg, :id
  json.url keg_url(keg, format: :json)
end
