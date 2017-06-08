json.array!(@songs) do |song|
  json.extract! song, :id, :artist, :songTitle, :songLength
  json.url song_url(song, format: :json)
end
