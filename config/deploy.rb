set :application, "xml"
set :repository,  "git://github.com/nathanael2020/xml.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "184.106.81.10"                          # Your HTTP server, Apache/etc
role :app, "184.106.81.10"                          # This may be the same as your `Web` server
role :db,  "184.106.81.10", :primary => true # This is where Rails migrations will run

set :user, "nathanael"
set :group, "staff"

default_run_options[:pty] = true



# Don't show so much! (Log levels: IMPORTANT, INFO, DEBUG, TRACE, MAX_LEVEL)
logger.level = Capistrano::Logger::DEBUG
 
# Since we're using pty, load the path ourselves
set :default_environment, {
  "PATH" => "/usr/local/rbenv/shims/bundle:/usr/local/rbenv/versions/1.9.3-p327/ruby/1.9.1/gems/:/home/nathanael/.gem/ruby:/usr/local/rbenv/shims:/home/nathanael/.rbenv/bin:/usr/local/rbenv/shims:/home/nathanael/.rbenv/bin:/usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/nathanael/.rbenv/shims:/home/nathanael/.rbenv/bin:$PATH"
}
 
 
namespace :deploy do

#  desc "Zero-downtime restart of Unicorn"
#  task :restart, roles: :app, :except => { :no_release => true } do
#    run "kill -s USR2 `cat /tmp/unicorn.xml.pid`"
#  end
 
#  desc "Start Unicorn"
#  task :start, roles: :app, :except => { :no_release => true } do
#    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
#  end
 
#  desc "Stop Unicorn"
#  task :stop, roles: :app, :except => { :no_release => true } do
#    run "kill -s QUIT `cat /tmp/unicorn.xml.pid`"
#  end 
 
 
namespace :assets do
 
    desc <<-DESC
      Run the asset precompilation rake task. You can specify the full path \
      to the rake executable by setting the rake variable. You can also \
      specify additional environment variables to pass to rake via the \
      asset_env variable. The defaults are:
 
        set :rake,      "rake"
        set :rails_env, "production"
        set :asset_env, "RAILS_GROUPS=assets"
 
      * only runs if assets have changed (add `-s force_assets=true` to force precompilation)
    DESC
    task :precompile, :roles => :web, :except => { :no_release => true } do
      # Only precompile assets if any assets changed
      # http://www.bencurtis.com/2011/12/skipping-asset-compilation-with-capistrano/

begin
      from = source.next_revision(current_revision)
      
            rescue 
        err_no = true
       end

      if fetch(:force_assets, false) || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ lib/assets/ | wc -l").to_i > 0
        # Just like original: https://github.com/capistrano/capistrano/blob/master/lib/capistrano/recipes/deploy/assets.rb
        run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile"
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
 
  end
  
end