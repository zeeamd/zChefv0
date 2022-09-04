Dir.foreach("#{node.default['cb6']['rpmpath']}") do |rpm_pkg|
 next if rpm_pkg == '.' or rpm_pkg == '..'
 rpm_package "#{node.default['cb6']['rpmpath']}/#{rpm_pkg}" do
  action :install
  notifies :run, 'execute[localenvcfg]', :immediately
 end
end

execute 'localenvcfg' do
  command "sh #{node.default['cb6']['envfilepath']}/#{node.default['cb6']['jenvfile']}"
end
