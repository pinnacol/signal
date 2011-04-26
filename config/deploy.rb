application = "signal"
repository = "git://github.com/pinnacol/signal.git"
hosts = ["panda"]
branch = "pinnacol"
user = "rails"
sudo = false
template = :pinnacol
@passenger_deploy_path = "/var/www/passenger/ci"
login_shell = true

before_restarting_server do
end
