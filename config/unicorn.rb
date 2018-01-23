# set path to application - proyectual
app_root = "/home/ubuntu/applications/proyectual/current"
shared_path = "/home/ubuntu/applications/proyectual/shared"
working_directory app_root

# Logging
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

# Set up socket location
listen "/tmp/unicorn.proyectual.sock", :backlog => 64

# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set master PID location
pid "#{shared_path}/pids/unicorn.proyectual.pid"
