json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :emotion_id, :logged_time
  json.url event_url(event, format: :json)
end
