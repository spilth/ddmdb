default_run_options[:pty] = true

set :application, "ddmdb"
set :scm, :git
set :repository,  "git@spilth.unfuddle.com:spilth/ddmdb.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, "/home/ddmdb/apps/#{application}"
set :user, "ddmdb"
set :use_sudo, false
set :runner, nil

role :app, "www.ddmdb.com"
role :web, "www.ddmdb.com"
role :db,  "www.ddmdb.com", :primary => true

namespace :deploy do 
  task :restart, :roles => :app do
    send(run_method, "cd #{deploy_to}/current && mongrel_rails restart")
  end
end


Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'
