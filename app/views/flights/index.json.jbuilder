json.array!(@flights) do |flight|
  json.extract! flight, :aeroline
  json.url flight_url(flight, format: :json)
end
