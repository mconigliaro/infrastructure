define :oh_my_zsh, :action => :install, :user => nil, :group => nil, :homedir => nil, :system_install => false, :manage_zshrc => false do

  params[:user]    ||= params[:name]
  params[:group]   ||= params[:user]
  params[:homedir] ||= "/home/#{params[:user]}"

  install_dir = params[:system_install] ? "/opt/oh-my-zsh" : "#{params[:homedir]}/.oh-my-zsh"

  case params[:action]
  when :install

    include_recipe "zsh"

    git install_dir do
      repository "git://github.com/robbyrussell/oh-my-zsh.git"
      user params[:user] unless params[:system_install]
      group params[:group] unless params[:system_install]
    end

    template "#{params[:homedir]}/.zshrc" do
      variables({
        :install_dir => install_dir
      })
      cookbook "zsh"
      source ".zshrc.erb"
      mode "0644"
      owner params[:user]
      group params[:group]
      only_if { !File.exist?("#{params[:homedir]}/.zshrc") || params[:manage_zshrc] }
    end

  when :remove

    execute "rm -rf #{install_dir}" do
      only_if { File.directory?(install_dir) && !params[:system_install] }
    end

    execute "rm #{params[:homedir]}/.zshrc" do
      only_if { File.exist?("#{params[:homedir]}/.zshrc") && params[:manage_zshrc] }
    end

  end

end
