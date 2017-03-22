json.array!(@tertiaries) do |tertiary|
  json.extract! tertiary, :id, :name, :emotion_id
  json.url tertiary_url(tertiary, format: :json)
end
