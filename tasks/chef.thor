require "pty"

class Chef < Thor

  desc "solo", "Run chef-solo"
  def solo
    PTY.spawn("chef-solo -c .chef/solo.rb -j .chef/workstation.json") do |r, w, pid|
      begin
        r.each { |line| print line }
      rescue Errno::EIO
      end
    end
  end

end
