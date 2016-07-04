`ssh-add`
set :application, 'forum'

set :repo_url, 'git@github.com:YengTsan/forum.git'
set :deploy_to, '/home/deploy/forum'
set :keep_releases, 5
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')  # 如果有 facebook.yml 或 email.yml 想要連結的話，也要加進來
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :passenger_restart_with_touch, true