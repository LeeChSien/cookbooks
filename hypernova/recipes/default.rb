bash "hypernova" do

    user 'root'
    group 'root'
    code <<-EOH
    
        kill -9 $(ps aux | grep '[n]ode app/config/ssr/hypernova.jsx' | awk '{print $2}')
        kill -9 $(ps aux | grep '[n]ode /root/.nvm/versions/node/v9.11.1/bin/http-server build -p 80 -a 0.0.0.0' | awk '{print $2}')

        source ~/.bashrc
        cd /srv/www/meetjobs_frontend/current/
        
        npm i

        nohup node app/config/ssr/hypernova.jsx > /dev/null &
        nohup http-server build -p 80 -a 0.0.0.0 > /dev/null &

    EOH
  
end
