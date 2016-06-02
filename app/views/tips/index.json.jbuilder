json.array!(@tips) do |tip|
  json.extract! tip, :id, :tip, :user_id, :frequency, :icon_id
  json.url tip_url(tip, format: :json)
end
