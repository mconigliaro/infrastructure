require "pty"

desc "Install required gems on this workstation"
task :gems do |t, args|
  gems = %w{
    chef
    foodcritic
    veewee
  }
  PTY.spawn("echo gem install #{gems.join(" ")}") do |r, w, pid|
    begin
      r.each { |line| print line }
    rescue Errno::EIO
    end
  end
end
