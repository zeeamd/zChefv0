#file "#{node.default['cb3']['fp']}/#{node.default['cb3']['fn']}" do
#  content "Hello, this is my third cookbook recipe\n"
#  action :create
#end

Dir.foreach("#{node.default['cb4']['rpmpath']}") do |rpm_pkg|
 next if rpm_pkg == '.' or rpm_pkg == '..'
 rpm_package "#{node.default['cb4']['rpmpath']}/#{rpm_pkg}" do
  action :install
 end
end
