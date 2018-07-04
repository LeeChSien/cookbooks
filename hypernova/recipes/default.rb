bash "hypernova" do

    user 'root'
    group 'root'
    code <<-EOH

        source ~/.bashrc
        cd /srv/www/meetjobs_frontend/current/

        nohup node app/config/ssr/hypernova.jsx > /dev/null &
        nohup http-server build -p 80 -a 0.0.0.0 > /dev/null &

    EOH
  
end
