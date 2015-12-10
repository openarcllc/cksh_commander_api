## :stars: Sla[CK] Sla[SH] Commander API

[![License](https://img.shields.io/packagist/l/doctrine/orm.svg)]()

This project provides a simple Sinatra API for processing Slack slash commands
with the [cksh_commander](https://github.com/openarcllc/cksh_commander) gem. It
comes bootstrapped with the boilerplate code and directory structure featured
in the [CKSHCommander README](https://github.com/openarcllc/cksh_commander).

### Installation

Clone the project, install dependencies, and start Sinatra!

```
$ git clone https://github.com/openarcllc/cksh_commander_api.git
$ cd cksh_commander_api
$ bundle install
$ ruby app.rb
```

You'll eventually want to deploy this to a server to which Slack can send requests.
Here's a [handy guide](https://www.digitalocean.com/community/tutorials/how-to-deploy-sinatra-based-ruby-web-applications-on-ubuntu-13)
for deploying a Sinatra app with Unicorn (or Passenger) and Nginx.

### Usage

Define custom command classes in the `commands/` directory. An example
implementation is provided for reference.

```ruby
# commands/example/command.rb

require "cksh_commander"

module Example
  class Command < CKSHCommander::Command
    set token: "gIkuvaNzQIHg97ATvDxqgjtO"

    # Subcommand with no arguments
    # SLACK: /example test0
    def test0
      set_response_text("Subcommand: test0")
    end

    # Subcommand with one argument
    # SLACK: /example test1 text
    def test1(text)
      set_response_text("Subcommand: test1; Text: #{text}")
    end

    # No subcommand with one argument
    # SLACK: /example text
    def ___(text)
      set_response_text("Root command; Text: #{text}")
    end
  end
end
```
