execute "Removing Node from Cluster" do
  command "curl -fsI -XPOST 'http://localhost:9200/_cluster/nodes/_local/_shutdown'"
end
