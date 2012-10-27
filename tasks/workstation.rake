require "pty"

desc "Run chef-solo on this workstation"
task :workstation do |t, args|
  PTY.spawn("chef-solo --color -c .chef/solo.rb -o 'role[workstation]'") do |r, w, pid|
    begin
      r.each { |line| print line }
    rescue Errno::EIO
    end
  end
end
