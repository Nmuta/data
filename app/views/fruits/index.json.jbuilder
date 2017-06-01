json.array!(@fruits) do |fruit|
  json.extract! fruit, :id, :name, :region, :code
  json.url fruit_url(fruit, format: :json)
end
