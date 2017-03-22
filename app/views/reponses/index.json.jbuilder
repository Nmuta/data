json.array!(@reponses) do |reponse|
  json.extract! reponse, :id, :name, :emotion_id
  json.url reponse_url(reponse, format: :json)
end
