REGIONS_URL = 'https://crest-tq.eveonline.com/regions/'.freeze

namespace :crest do
  namespace :import do
    desc 'Imports regions data'
    task regions: :environment do
      ActiveRecord::Migration.say_with_time('Importing regions...') do
        uri  = URI(REGIONS_URL)
        json = JSON.parse(open(uri).read)
        regions_json = json.fetch('items')
        progress_bar  = ProgressBar.create(title: 'Regions',
                                           total: regions_json.size,
                                           format: '%t, %c/%C: |%B|')

        regions_json.each do |region|
          Region.create_with(name: region['name'], crest_url: region['href']).find_or_create_by(crest_id: region['id'])

          progress_bar.increment
        end
      end
    end
  end
end
