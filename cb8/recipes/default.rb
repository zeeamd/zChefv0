include_recipe 'tar::default'

directory "#{node.default['cb8']['tomcatpath']}/cert" do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

tar_extract "#{node.default['cb8']['tarfile']}/#{node.default['cb8']['tomcatpkg']}" do
  target_dir "#{node.default['cb8']['tomcatpath']}"
  tar_flags [ '-P', '--strip-components 1' ]
  source "#{node.default['cb8']['tomcatpkg']}"
  creates "#{node.default['cb8']['tmvnfile']}"
  action :extract_local
  #notifies :run, "execute[localenvcfg]", :immediately
end

node.default['cb8']['tomcatcfg'].each do |p|
  template "#{node.default['cb8']['tomcatpath']}/conf/#{p}" do
  	mode '0440'
  	owner 'root'
  	group 'root'
  end
end

node.default['cb8']['tomcatbintemplates'].each do |p|
template "#{node.default['cb8']['tomcatpath']}/bin/#{p}" do
        mode '0540'
        owner 'root'
        group 'root'
  end
end

template "#{node.default['cb8']['tomcatinittemplates']}" do
        mode '0540'
        owner 'root'
        group 'root'
end

service 'tomcat' do
  supports :status => true, :restart => true, :reload => true
  action :start
  subscribes :restart, "template[#{node.default['cb8']['tomcatinittemplates']}]", :immediately
end
