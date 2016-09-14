lock '3.6.1'

set :application, 'killboard'
set :repo_url, 'git@github.com:roflomglol/killboard.git'
set :deploy_to, '/home/deployer/apps/killboard'

append :linked_files, 'config/database.yml',
                      'config/secrets.yml',
                      '.env.production'

append :linked_dirs, 'log',
                     'tmp/pids',
                     'tmp/cache',
                     'tmp/sockets',
                     'public/system',
                     'vendor/bundle'

set :rbenv_ruby, '2.3.1'
set :rbenv_map_bins, %w(rake gem bundle ruby rails eye)
set :bundle_bins, fetch(:bundle_bins, []).push('eye')

after 'deploy:started', 'assets:precompile'
after 'deploy:updated', 'assets:deliver'
after 'deploy:restart', 'deploy:cleanup', 'eye:restart'
