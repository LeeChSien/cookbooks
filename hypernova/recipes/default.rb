bash "hypernova" do

    user 'root'
    group 'root'
    code <<-EOH
      
        cd /srv/www/meetjobs_frontend/current/

        node app/config/ssr/hypernova.jsx > /dev/null &
        http-server build -p 80 -a 0.0.0.0 > /dev/null &

    EOH
  
end
