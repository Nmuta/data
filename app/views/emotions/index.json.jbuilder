json.array!(@emotions) do |emotion|
  json.extract! emotion, :id, :emotion
  json.url emotion_url(emotion, format: :json)
end
