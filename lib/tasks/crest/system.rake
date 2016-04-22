CONSTELLATIONS_URL = 'https://public-crest.eveonline.com/constellations/'.freeze

namespace :crest do
  namespace :system do
    task import: :environment do
      Rake::Task['crest:region:import'].execute

      uri = URI(CONSTELLATIONS_URL)
      response = Net::HTTP.get(uri)
      json_response = JSON.parse(response)

      json_response.fetch('items').map{ |constellation| constellation.fetch('href') }.each do |constellation_url|
        constellation_uri = URI(constellation_url)
        constellation_response = Net::HTTP.get(constellation_uri)
        constellation_json_response = JSON.parse(constellation_response)
        constellation_region = Region.find_by!(crest_id: constellation_json_response.fetch('region').fetch('href')[/\d+/])

        constellation_json_response.fetch('systems').map{ |system| system.fetch('href') }.each do |system_url|
          next if System.find_by(crest_url: system_url)

          system_uri = URI(system_url)
          system_response = Net::HTTP.get(system_uri)
          system_json_response = JSON.parse(system_response)

          System.create_with(name: system_json_response['name'],
                             security_status: system_json_response['securityStatus'].round(1),
                             crest_url: system_json_response['href'],
                             region: constellation_region).find_or_create_by(crest_id: system_json_response['id'])
        end

        puts "All systems from constellation #{constellation_url} are imported"
      end
    end
  end
end
