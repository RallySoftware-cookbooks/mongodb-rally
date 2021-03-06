#
# Cookbook Name:: mongodb-rally
# Recipe:: client
#
# Copyright (c) 2013 Rally Software Development Corp
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

if node[:platform_family] == 'rhel'
    yum_repository '10gen' do
      description '10gen RPM Repository'
      url "http://downloads-distro.mongodb.org/repo/redhat/os/#{node[:kernel][:machine]  =~ /x86_64/ ? 'x86_64' : 'i686'}"
      gpgcheck false
    action :add
  end
else
  Chef::Log.warn("Adding the #{node[:platform_family]} 10gen repository is not yet not supported by this cookbook")
end

package 'mongo-10gen'
