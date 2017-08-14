class FoodPusher < Chef::Knife
  deps do
    require 'chef/node'
    require 'chef/search/query'
  end

  def initialize(job)
    @job = job
  end

  def start
    result = rest.post_rest('pushy/jobs', @job)
  end

  def status(job_uri)
    job_id = job_uri['uri'].split('/').last
    result = rest.get_rest("pushy/jobs/#{job_id}")
  end

  def node_status(nodes)
    if nodes.empty?
      rest.get_rest('pushy/node_states')
    else
      results = []
      nodes.each do |node|
        results << rest.get_rest("pushy/node_states/#{node}")
      end
    end
    results
  end
end
