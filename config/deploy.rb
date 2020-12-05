lock "~> 3.14.1"

server '3.140.6.193', port: 22, roles: [:web, :app, :db], primary: true

set :repo_url, 'git@github.com:nterone-corp/canvas-lms.git'
set :application, 'canvas'
set :user, 'ubuntu' #server user

# set :rvm_bin_path, "/home/rails/.rvm"
# set :rvm_ruby_version, 'ruby-2.6.1@canvar'

# Don't change these unless you know what you're doing
set :pty, true
set :use_sudo, false
set :rails_env, "production"
set :stage, :production
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/var/#{fetch(:application)}"
set :rvm_ruby_version, '2.6.1'
set :branch, :master


set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }


set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system','public/assets' ,'public/uploads')

namespace :deploy do

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     within release_path do
  #       execute :rake, "canvas:compile_assets", "RAILS_ENV=#{fetch :rails_env}"
  #     end
  #   end
  # end
end