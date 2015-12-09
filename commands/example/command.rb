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
