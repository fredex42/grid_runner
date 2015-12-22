class App
  PROCFILE = File.open(Dir.pwd + "/Procfile")
  
  attr_reader :name, :command, :status, :pid

  def initialize(name, command, status, pid)
    @name    = name
    @command = command
    @status  = status
    @pid     = pid
  end

  def self.all
    PROCFILE.map do |line|
      App.from_procfile(line)
    end
  end

  def self.find(args)
    App.all.select { |app| args.include?( app.name ) }
  end

  def self.from_procfile(line)
    name = line.split(":")[0]
    cmd = line.split(":")[1]
    ps_out = ps_out(name)
    status = ps_out[:status]
    pid = ps_out[:pid]

    App.new(name, cmd, status, pid)
  end

  def display(color_index = rand(0..COLORS.length))
    puts Rainbow("#{name} ").send(COLORS[color_index % COLORS.length]).underline 
    puts "status: #{status}"
    puts "pid: #{pid}" if status == :running
    puts "log: #{log.path}"
    puts
  end

  def kill!
    if status == :running
      Process.kill("HUP", pid.to_i)
      puts "kilt #{name}"
    end
  end

  def log
    File.open((Dir.pwd + "/logs/" + "#{name}.log"), "w+")
  end

  def run
    # stdout, stderr, cmd_status = Open3.capture3(["echo"], command)        
    puts "running: #{name}"
    io_write = IO.pipe[1]
    Process.spawn(
      ENV,
      command, 
      out: [log.path, "w"], 
      err: [log.path, "w"], 
      :in => "/dev/tty",
      close_others: false
    )
  end

  def status
    @status ||= App.ps_out(name)[:status]
  end

  private

  def self.ps_out(name)
    stdout, stderr, cmd_status = Open3.capture3("ps aux | grep #{name}")
    if cmd_status.success?
      if p = stdout.split(/\n/).find {|l| l.match("sbt")}
        proc_status = :running
        pid = p.match(/\d{4,8}\s/)[0]
      else
        proc_status = :not_running
      end
    end
    {status: proc_status, pid: pid}
  end
end