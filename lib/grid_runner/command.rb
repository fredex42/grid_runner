require 'open3'

module Command
  def self.run(cmd)
    stdout, stderr, status = Open3.capture3(command)
    STDERR.puts(stderr)
    if status.success?
      stdout.split(/\n/)
      true
    else
      STDERR.puts("Error running: #{cmd}")
      false
    end
    return status
  end
end