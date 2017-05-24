json.array!(@rogues) do |rogue|
  json.extract! rogue, :id, :name
  json.url rogue_url(rogue, format: :json)
end
