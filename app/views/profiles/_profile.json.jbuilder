json.extract! profile, :id, :screenname, :city, :created_at, :updated_at
json.url profile_url(profile, format: :json)
