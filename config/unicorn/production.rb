root = '/home/deployer/apps/killboard/current'
working_directory root

pid "#{root}/tmp/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

worker_processes 2
timeout 30
preload_app true

listen "#{root}/tmp/sockets/unicorn.killboard.sock"

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV['BUNDLE_GEMFILE'] = File.join(root, 'Gemfile')
end

before_fork do |server, _worker|
  old_pid = "#{server.config[:pid]}.oldbin"

  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if File.exist?(old_pid) && server.pid != old_pid
    Process.kill('QUIT', File.read(old_pid).to_i)
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
