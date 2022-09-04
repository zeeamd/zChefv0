#tar_extract '/root/CST1/cookbooks/cb7/rpmdump/apache-maven-3.5.3-src.tar.gz' do
#  action :extract_local
#  target_dir '/usr/local/maven'
#  tar_flags [ '-P', '--strip-components 1' ]
#end
include_recipe 'tar::default'

directory "#{node.default['cb7']['mvnpath']}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  #notifies :run, "resource[tar_extract]", :immediately
end

tar_extract '/root/CST1/cookbooks/cb7/rpmdump/apache-maven-3.5.3-src.tar.gz' do
  target_dir "#{node.default['cb7']['mvnpath']}"
  tar_flags [ '-P', '--strip-components 1' ]
  source 'apache-maven-3.5.3-src.tar.gz'
  creates '/root/abc.txt'
  action :extract_local
end
