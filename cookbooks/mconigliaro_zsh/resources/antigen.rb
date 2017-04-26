actions :install, :uninstall
default_action :install

property :user, name_attribute: true
property :theme, kind_of: String, default: 'robbyrussell'
property :bundles, kind_of: Array, default: []
property :exports, kind_of: Hash, default: {}

action :install do
  package 'git'

  git "#{Dir.home(new_resource.name)}/.antigen" do
    repository 'https://github.com/zsh-users/antigen.git'
    user new_resource.name
    group new_resource.name
    depth 1
    action :checkout
  end

  template "#{Dir.home(new_resource.name)}/.zshrc" do
    cookbook 'mconigliaro_zsh'
    variables(
      theme: new_resource.theme,
      bundles: new_resource.bundles,
      exports: new_resource.exports
    )
    owner new_resource.name
    group new_resource.name
    mode '0644'
    action :create_if_missing
  end
end

action :uninstall do
  directory "#{Dir.home(new_resource.name)}/.antigen" do
    recursive true
    action :delete
  end
end
