ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'json'
require 'rspec'
require 'rack/test'

describe 'CKSH Commander API' do
  include Rack::Test::Methods

  paramstub = {
    "token" => "gIkuvaNzQIHg97ATvDxqgjtO",
    "team_id" => "T0001",
    "team_domain" => "example",
    "channel_id" => "C2147483705",
    "channel_name" => "test",
    "user_id" => "U2147483697",
    "user_name" => "Randy",
    "command" => "/example",
    "text" => "",
    "response_url" => "https://hooks.slack.example.com/commands/1234/5678"
  }

  def app
    Sinatra::Application
  end

  it "responds to root command properly" do
    post '/', paramstub.merge({ "text": "yes" })
    body = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(body["text"]).to eq("Root command; Text: yes")
  end

  it "responds to a subcommand properly" do
    post '/', paramstub.merge({ "text" => "test0" })
    body = JSON.parse(last_response.body)
    expect(last_response).to be_ok
    expect(body["text"]).to eq("Subcommand: test0")
  end
end
