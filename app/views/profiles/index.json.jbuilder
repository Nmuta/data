json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :hair_choice, :skin_tone, :facebase, :nose, :glasses, :moustache, :active
  json.url profile_url(profile, format: :json)
end
