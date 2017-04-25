use_inline_resources

action :install do
  package 'git'

  git "#{Dir.home(new_resource.name)}/.oh-my-zsh" do
    repository 'https://github.com/robbyrussell/oh-my-zsh.git'
    user new_resource.name
    group new_resource.name
    depth 1
    action :checkout
  end

  template "#{Dir.home(new_resource.name)}/.zshrc" do
    cookbook 'mconigliaro_zsh'
    variables(
      theme: new_resource.theme
    )
    owner new_resource.name
    group new_resource.name
    mode '0644'
    action :create_if_missing
  end
end

action :uninstall do
  directory "#{Dir.home(new_resource.name)}/.oh-my-zsh" do
    recursive true
    action :delete
  end
end
