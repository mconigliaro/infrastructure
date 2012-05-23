require "etc"

# Return the home directory for the specified user
def homedir(user)
  Etc.getpwnam(user).dir
end
