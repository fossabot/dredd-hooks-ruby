require 'dredd_hooks'

module DreddHooks
  class CLI

    def self.start(error=STDERR, input=STDIN, out=STDOUT)

      # Disables stdout buffering. This makes node.js able to capture stdout of this process with no delay
      # http://stackoverflow.com/questions/23001033/how-to-live-stream-output-from-ruby-script-using-child-process-spawn
      $stdout.sync = true

      # Load all files given on the command-line
      DreddHooks::FileLoader.load ARGV

      # Run the server

      puts 'Starting Ruby Dredd Hooks Worker'
      server = DreddHooks::Server.new
      server.run
    end
  end
end

