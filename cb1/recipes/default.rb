#
# Cookbook:: cb1
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

file "/root/hello.txt" do
  content "Hello, this is my first cookbook recipe\n"
  action :create
end
