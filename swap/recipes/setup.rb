
bash "set swap" do

  user 'root'
  group 'root'
  code <<-EOH

    /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=2048
    /sbin/mkswap /var/swap.1
    chmod 600 /var/swap.1
    /sbin/swapon /var/swap.1

    EOH

end
