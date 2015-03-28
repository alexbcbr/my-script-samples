template "/etc/sysconfig/clock" do
source "clock.erb"
owner "root"
group "root"
mode 0644
end

link "/etc/localtime" do
to "/usr/share/zoneinfo/Brazil/East"
action :create
end

template "/etc/cron.daily/ntpdate" do
source "ntpdate.erb"
mode 0755
owner "root"
group "root"
end

