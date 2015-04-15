# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.2"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.5"
github "go",          "2.1.0"
github "homebrew",    "1.11.2"
github "hub",         "1.4.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# JH - added
github "alfred",      "1.4.0"
github "iterm2",      "1.2.4"
github "atom",        "1.2.0"
github "gitx",        "1.2.0"

github "osx",         "2.8.0"
github "dropbox",     "1.4.1"
github "fish",        "1.0.0"
# https://github.com/boxen/puppet-osx
# https://github.com/boxen/puppet-java
# https://github.com/boxen/puppet-vagrant
# ??? https://github.com/boxen/puppet-virtualbox
# https://github.com/boxen/puppet-docker
#  https://github.com/boxen/puppet-sublime_text
# https://github.com/boxen/puppet-libreoffice
# https://github.com/boxen/puppet-dropbox
# https://github.com/boxen/puppet-tunnelblick
# https://github.com/boxen/puppet-firefox
# https://github.com/boxen/puppet-chrome
# https://github.com/boxen/puppet-clojure
# https://github.com/boxen/puppet-skitch
# https://github.com/boxen/puppet-dash
# ??? https://github.com/boxen/puppet-jq
# ??? https://github.com/boxen/puppet-growly
# ? https://github.com/boxen/puppet-emacs
# https://github.com/boxen/puppet-vlc
# ? https://github.com/boxen/puppet-intellij
# https://github.com/boxen/puppet-wget
# ? https://github.com/boxen/puppet-transmit / https://github.com/boxen/puppet-transmission
# https://github.com/boxen/puppet-heroku
# !? https://github.com/boxen/puppet-repository
# # https://github.com/boxen/puppet-handbrake
# https://github.com/boxen/puppet-fish
# https://github.com/boxen/puppet-nvm
# ? https://github.com/boxen/puppet-autojump
# https://github.com/boxen/puppet-googledrive
# ? https://github.com/boxen/puppet-csshx
# Optional/custom modules. There are tons available at
# https://github.com/boxen.
