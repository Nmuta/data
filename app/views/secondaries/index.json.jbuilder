json.array!(@secondaries) do |secondary|
  json.extract! secondary, :id, :name, :emotion_id
  json.url secondary_url(secondary, format: :json)
end
