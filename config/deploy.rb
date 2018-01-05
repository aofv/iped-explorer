# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "ipeds-api"
set :repo_url, "git@github.com:aofv/iped-explorer.git"
set :rvm_ruby_version, '2.3.1@5.1'

set :branch, 'release'

set :keep_releases, 5

desc "Restart Puma"
task :restart_puma do
  on roles(:app) do
    execute :sudo, "service puma-manager restart"
  end
end
after 'deploy:publishing', :restart_puma

# desc "Deploy UI"
# task :deploy_ui do
#   run_locally do
#     execute :sh, '-c \'cd ./ui && npm run build\''
#     execute :scp, '-r ui/dist/* puma-worker@aov01.athletesofvalor.com:/var/www/ipeds-ui'
#   end
# end
# before :restart_puma, :deploy_ui


append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
