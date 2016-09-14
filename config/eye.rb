ROOT_PATH = File.expand_path('../..', __FILE__)
RAILS_ENV = ENV['RAILS_ENV'] || 'production'

Eye.config do
  logger "#{ROOT_PATH}/log/eye.log"
end

Eye.application 'killboard' do
  working_dir ROOT_PATH
  env(
    'RAILS_ENV' => RAILS_ENV,
    'RBENV_ROOT' => '~/.rbenv/',
    'PATH' => "~/.rbenv/shims:~/.rbenv/bin:#{ENV['PATH']}",
    'TMPDIR' => '/home/deploy/tmp'
  )

  trigger :flapping, times: 10, within: 1.minute, retry_in: 10.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3

  process 'unicorn' do
    pid_file 'tmp/pids/unicorn.pid'
    start_command "bundle exec unicorn -Dc #{ROOT_PATH}/config/unicorn/production.rb -E #{RAILS_ENV}"
    stop_command 'kill -QUIT {{PID}}'
    restart_command 'kill -USR2 {{PID}}'
    stdall 'log/unicorn.log'

    start_timeout 50.seconds
    stop_grace 5.seconds
    restart_grace 10.seconds

    checks :memory, every: 30, below: 256.megabytes, times: [3, 5]

    monitor_children do
      stop_command 'kill -QUIT {{PID}}'
      checks :cpu, every: 30, below: 80, times: 3
      checks :memory, every: 30, below: 128.megabytes, times: [3, 5]
    end
  end
end
