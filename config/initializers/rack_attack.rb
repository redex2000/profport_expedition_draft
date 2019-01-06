Rack::Attack.blocklist(:paranoid) do |request|
  ['127.0.0.1', 'localhost', '0.0.0.0'].include? request.ip
end