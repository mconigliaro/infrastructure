require "pty"

class Setup < Thor

  desc "gems", "Install required gems"
  def gems
    gems = %w{
      chef
      vagrant
      veewee
    }
    PTY.spawn("gem install #{gems.join(" ")}") do |r, w, pid|
      begin
        r.each { |line| print line }
      rescue Errno::EIO
      end
    end
  end

end
