#
# Cookbook Name:: sidekiq
# Recipe:: restart
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
  
  execute "replace sidekiq.yml" do
    command "yes | cp -rf  #{deploy[:deploy_to]}/shared/config/sidekiq.yml #{deploy[:deploy_to]}/current/config/sidekiq.yml "
    action :run
    only_if do
      deploy[:sidekiq]
    end
  end

  execute "restart-sidekiq" do
    command %Q{
      monit -g sidekiq_#{application} restart all
    }
  end
end
