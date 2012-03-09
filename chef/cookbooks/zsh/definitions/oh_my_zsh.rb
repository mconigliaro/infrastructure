define :oh_my_zsh, :action => :install, :user => nil, :group => nil, :homedir => nil, :manage_zshrc => false do

  params[:user]    ||= params[:name]
  params[:group]   ||= params[:user]
  params[:homedir] ||= "/home/#{params[:user]}"

  case params[:action]
  when :install

    include_recipe "zsh"

    template "#{params[:homedir]}/.zshrc" do
      cookbook "zsh"
      source ".zshrc.erb"
      mode "0644"
      owner params[:user]
      group params[:group]
      only_if { !File.exist?("#{params[:homedir]}/.zshrc") || params[:manage_zshrc] }
    end

  when :remove

    execute "rm #{params[:homedir]}/.zshrc" do
      only_if { File.exist?("#{params[:homedir]}/.zshrc") && params[:manage_zshrc] }
    end

  end

end
