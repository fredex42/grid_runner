module Applications
  class App < Struct.new(:name, :cmd, :status, :pid); end

  def self.get_all
    procfile = File.open(Dir.pwd + "/Procfile")
    applications = procfile.map do |line|
        name = line.split(":")[0]
        cmd = line.split(":")[1]
        stdout, stderr, cmd_status = Open3.capture3("ps aux | grep #{name}")

        if cmd_status.success?
          if p = stdout.split(/\n/).find {|l| l.match("sbt")}
            proc_status = :running
            pid = p.match(/\d{4,8}\s/)[0]
          else
            proc_status = :not_running
         end         
       end
      App.new(name, cmd, proc_status, pid)
    end
  end
end