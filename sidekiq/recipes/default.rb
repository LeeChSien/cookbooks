#
# Cookbook Name:: sidekiq
# Recipe:: default
#

node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]}/shared/config/sidekiq.yml" do
    source "sidekiq.yml.erb"
    mode "0660"
    group deploy[:group]
    owner deploy[:user]
    variables(:sidekiq => deploy[:sidekiq])

    only_if do
      deploy[:sidekiq]
    end
  end

  template "#{node[:monit][:conf_dir]}/sidekiq_#{application}.monitrc" do
    owner 'root'
    group 'root'
    mode 0644
    source "monitrc.conf.erb"
    variables({
      :worker_count => 1,
      :app_name => application,
      :deploy => deploy
    })
  end

  execute "replace sidekiq.yml" do
    command "yes | cp -rf  #{deploy[:deploy_to]}/shared/config/sidekiq.yml #{deploy[:deploy_to]}/current/config/sidekiq.yml "
    action :run
    only_if do
      deploy[:sidekiq]
    end
  end

  execute "ensure-sidekiq-is-setup-with-monit" do
    command %Q{
      monit reload
    }
  end

  execute "restart-sidekiq" do
    command %Q{
      echo "sleep 20 && monit -g sidekiq_#{application} restart all" | at now
    }
  end
end
