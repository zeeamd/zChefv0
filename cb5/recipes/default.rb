Dir.foreach("#{node.default['cb5']['rpmpath']}") do |rpm_pkg|
 next if rpm_pkg == '.' or rpm_pkg == '..'
 rpm_package "#{node.default['cb5']['rpmpath']}/#{rpm_pkg}" do
  action :remove
 end
end
