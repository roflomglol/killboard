REGIONS_URL = 'https://public-crest.eveonline.com/regions/'.freeze

namespace :crest do
  namespace :region do
    task import: :environment do
      uri = URI(REGIONS_URL)
      response = Net::HTTP.get(uri)
      json_response = JSON.parse(response)

      json_response['items'].each do |region|
        Region.create_with(name: region['name'], crest_url: region['href']).find_or_create_by(crest_id: region['id'])
      end
    end
  end
end
