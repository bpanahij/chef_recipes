#
# Cookbook Name:: mongodb
# Attributes:: default
#
# Copyright 2010, edelight GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:mongodb][:dbpath] = "/var/lib/mongodb"
default[:mongodb][:logpath] = "/var/log/mongodb"
default[:mongodb][:bind_ip] = nil
default[:mongodb][:port] = 27017
default[:mongodb][:configfile] = nil

# cluster identifier
default[:mongodb][:client_roles] = []
default[:mongodb][:cluster_name] = nil
default[:mongodb][:replicaset_name] = nil
default[:mongodb][:shard_name] = "default"

# replica options
default[:mongodb][:replica_arbiter_only] = false
default[:mongodb][:replica_build_indexes] = true
default[:mongodb][:replica_hidden] = false
default[:mongodb][:replica_slave_delay] = 0
default[:mongodb][:replica_priority] = 1
default[:mongodb][:replica_tags] = {}
default[:mongodb][:replica_votes] = 1

default[:mongodb][:auto_configure][:replicaset] = true
default[:mongodb][:auto_configure][:sharding] = true
default[:mongodb][:key_file] = nil

# don't use the node's fqdn, but this url instead; something like 'ec2-x-y-z-z.aws.com' or 'cs1.domain.com' (no port)
# if not provided, will fall back to the FQDN
default[:mongodb][:configserver_url] = nil

default[:mongodb][:enable_rest] = false
default[:mongodb][:smallfiles] = false

default[:mongodb][:user] = "mongodb"
default[:mongodb][:group] = "mongodb"
default[:mongodb][:root_group] = "root"

# http://docs.mongodb.org/manual/reference/ulimit/#recommended-settings
default[:mongodb][:ulimit][:file_size] = "unlimited"
default[:mongodb][:ulimit][:cpu_time] = "unlimited"
default[:mongodb][:ulimit][:virtual_memory] = "unlimited"
default[:mongodb][:ulimit][:open_files] = 64000
default[:mongodb][:ulimit][:memory_size] = "unlimited"
default[:mongodb][:ulimit][:processes] = 32000

default[:mongodb][:init_dir] = "/etc/init.d"

default[:mongodb][:init_script_template] = "mongodb.init.erb"

case node['platform_family']
when "freebsd"
  default[:mongodb][:defaults_dir] = "/etc/rc.conf.d"
  default[:mongodb][:init_dir] = "/usr/local/etc/rc.d"
  default[:mongodb][:root_group] = "wheel"
  default[:mongodb][:package_name] = "mongodb"
  default[:mongodb][:instance_name] = "mongodb"

when "rhel","fedora"
  default[:mongodb][:defaults_dir] = "/etc/sysconfig"
  default[:mongodb][:package_name] = "mongo-10gen-server"
  default[:mongodb][:user] = "mongod"
  default[:mongodb][:group] = "mongod"
  default[:mongodb][:init_script_template] = "redhat-mongodb.init.erb"
  default[:mongodb][:instance_name] = "mongod"

else
  default[:mongodb][:defaults_dir] = "/etc/default"
  default[:mongodb][:root_group] = "root"
  default[:mongodb][:package_name] = "mongodb-10gen"
  default[:mongodb][:apt_repo] = "debian-sysvinit"
  default[:mongodb][:instance_name] = "mongodb"

end

default[:mongodb][:package_version] = nil
default[:mongodb][:nojournal] = false
default[:mongodb][:template_cookbook] = "mongodb"
default[:mongodb][:oplog_size] = nil
