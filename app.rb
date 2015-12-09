require "sinatra"
require "json"
require "cksh_commander"

disable :static

CKSHCommander.configure do |c|
  c.commands_path = File.expand_path("../commands", __FILE__)
end

post "/" do
  content_type :json

  command = params["command"][1..-1]
  response = CKSHCommander::Runner.run(command, params)
  JSON.dump(response.serialize)
end
