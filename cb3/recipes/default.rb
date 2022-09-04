file "#{node.default['cb3']['fp']}/#{node.default['cb3']['fn']}" do
  content "Hello, this is my third cookbook recipe\n"
  action :create
end
