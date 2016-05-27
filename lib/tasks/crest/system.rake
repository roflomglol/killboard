CONSTELLATIONS_URL = 'https://public-crest.eveonline.com/constellations/'.freeze

namespace :crest do
  namespace :system do
    task import: :environment do
      Rake::Task['crest:region:import'].invoke

      uri           = URI(CONSTELLATIONS_URL)
      response      = Net::HTTP.get(uri)
      json_response = JSON.parse(response)

      progress_bar  = ProgressBar.create(title: 'Parsing constellations',
                                         total: json_response.fetch('items').size,
                                         format: '%t, %c/%C: |%B|')

      json_response.fetch('items').map{ |constellation| constellation.fetch('href') }.each do |constellation_url|
        parse_constellation(constellation_url)
        progress_bar.increment
      end
    end
  end
end

def parse_constellation(constellation_url)
  uri           = URI(constellation_url)
  response      = Net::HTTP.get(uri)
  json_response = JSON.parse(response)
  region        = Region.find_by!(crest_id: json_response.fetch('region').fetch('href')[/\d+/])

  json_response.fetch('systems').map{ |system| system.fetch('href') }.each do |system_url|
    parse_system(system_url, region)
  end
end

def parse_system(system_url, region)
  return if System.find_by(crest_url: system_url)

  uri           = URI(system_url)
  response      = Net::HTTP.get(uri)
  json_response = JSON.parse(response)

  System.create_with(name: json_response.fetch('name'),
                     security_status: json_response.fetch('securityStatus').round(1),
                     crest_url: json_response.fetch('href'),
                     region: region).find_or_create_by(crest_id: json_response.fetch('id'))
end
