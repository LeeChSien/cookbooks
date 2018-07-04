
bash "install nodejs" do

  user 'root'
  group 'root'
  code <<-EOH

    cd ~
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    source .bashrc
    nvm install v9.11.1
    npm i -g http-server
    
  EOH

end
