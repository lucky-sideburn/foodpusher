# Foodpusher

You can use foodpusher gem to control push jobs for Chef Server inside ruby scripts and applications.

![Alt text](logo/img.png)

Liks to Chef docs:
* [https://docs.chef.io/push_jobs.html]: Chef Push Jobs
* [https://docs.chef.io/api_push_jobs.html]: Push Jobs API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'foodpusher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install foodpusher

## Example: Run job from ruby scripts:


```
require 'chef/knife'
require 'chef/knife/foodpusher'

job = { 'command' => 'chef-client',
        'nodes' => ['client01.local', 'chef-server'],
        'quorum' => 1,
        'capture_output' => false,
        'env' => {} }

Chef::Config.chef_server_url = 'https://chef.devops.foobar.lan/organizations/chef'
Chef::Config.client_key = '/vagrant/chef-server.local/.chef/chef.pem'
Chef::Config.node_name = 'chef'
Chef::Config.ssl_verify_mode = :verify_none
pusher = FoodPusher.new(job)

# Start Job
myjob = pusher.start
puts "Job uri #{myjob}"
status = (pusher.status myjob)['status']

# Check Job Status
while status == 'running'
  status = (pusher.status myjob)['status']
  puts status
  sleep 1
end

# Check Node Status
(pusher.node_status job['nodes']).each do |result|
  puts result
end
```

## Outputs

### Let's pushing chef-client execution to two nodes...

```
Job uri {"uri"=>"https://chef.devops.foobar.lan/organizations/chef/pushy/jobs/336d0bf2dc771d3127dffead469381b5"}
running
running
running
running
running
complete
{"node_name"=>"client01.local", "status"=>"online", "availability"=>"available"}
{"node_name"=>"chef-server", "status"=>"online", "availability"=>"available"}
```

### Outputs description

**start a job and getting its uri**
```
{"uri"=>"https://chef.devops.foobar.lan/organizations/chef/pushy/jobs/336d0bf2dc771d3127dffead469381b5"}
```


**getting job status**
```
...
running
running
running
complete
```

**getting node status**
```
{"node_name"=>"client01.local", "status"=>"online", "availability"=>"available"}
{"node_name"=>"chef-server", "status"=>"online", "availability"=>"available"}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lucky-sideburn/foodpusher.

