#
# Cookbook Name:: sidekiq
# Recipe:: restart
#

node[:deploy].each do |application, deploy|
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
