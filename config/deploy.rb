application = "signal"
repository = "git://github.com/pinnacol/signal.git"
hosts = ["panda"]
branch = "pinnacol"
path = "/var/www/rails-apps"
user = "rails"
sudo = false
template = :rails3

before_restarting_server do
  run "script/delayed_job -e production restart"
end
