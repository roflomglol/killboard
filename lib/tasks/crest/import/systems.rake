SYSTEMS_URL = 'https://crest-tq.eveonline.com/solarsystems/'.freeze

namespace :crest do
  namespace :import do
    desc 'Imports systems data'
    task systems: [:environment, :regions] do
      ActiveRecord::Migration.say_with_time('Importing systems data') do
        regions = Region.all.pluck(:id, :crest_url).to_h
        systems = JSON.parse(open(SYSTEMS_URL).read)
                      .fetch('items')
                      .each_with_object({}) { |item, hash| hash[item.fetch('id')] = item.fetch('name') }
        progress_bar  = ProgressBar.create(title: 'Systems',
                                           total: systems.size,
                                           format: '%t, %c/%C: |%B|')

        regions.each do |id, crest_url|
          region_constellations = JSON.parse(open(crest_url).read).fetch('constellations')

          region_constellations.each do |constellation|
            constellation_system_ids = JSON.parse(open(constellation.fetch('href')).read)
                                           .fetch('systems')
                                           .map { |system| system.fetch('id') }

            constellation_system_ids.each do |system_id|
              System.create_with(name: systems.fetch(system_id),
                                 crest_url: "#{SYSTEMS_URL}#{system_id}/")
                    .find_or_create_by(crest_id: system_id)

              progress_bar.increment
            end
          end
        end
      end
    end
  end
end
