# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'DisasterMeshVisualiser'
set :repo_url, 'git@github.com:DisasterMeshVisualiser/api.git'
set :branch, 'master'

set :deploy_to, '/var/www/disasterMeshVisualiser'
set :scm, :git
set :log_level, :debug
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do #タスクnamespace
  #desc 'タスク説明'
  #task :restart do #タスク定義
  #ここにタスク処理内容を記述
  #end
  #after :finishing, 'deploy:cleanup' #task実行タイミングを指定できます。詳細は下記
  #http://capistranorb.com/documentation/getting-started/flow/
  #サンプルにunicorn再起動タスク
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
  after :finishing, 'deploy:cleanup'
end
