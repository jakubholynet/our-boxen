class people::jakubholynet {
  # Symlink to fix Atom install, see
  # https://github.com/caskroom/homebrew-cask/issues/4716
  file { '/usr/local':
    ensure => link,
    target => '/opt/boxen',
  }
  #include emacs   # requires emacs module in Puppetfile
  #include sparrow # requires sparrow module in Puppetfile
  #include gitx::dev # FAILS: Unknown flavor .zip

  #include alfred # Fails: Unknown flavor .zip
  include iterm2::stable # see https://github.com/boxen/puppet-iterm2

  include atom
  atom::package { ['linter', 'jshint', 'react','lodash-snippets','javascript-snippets','script','refactor','js-refactor','test-status']: }
  # Consider: mocha-test-runner
  # atom::package { 'editorconfig': } # Fails b/c pkg edit. already exists (but in himebrew, not atom)

  #package { 'puppet-lint': ensure => installed, provider => 'gem' }
  # ^ Fails:
  # Error: Could not prefetch package provider 'gem': Could not list gems: Execution of '/opt/boxen/rbenv/shims/gem list --local' returned 1: /Library/Ruby/Gems/1.8/gems/bundler-1.5.3/lib/bundler/spec_set.rb:92:in `block in materialize': Could not find rake-10.3.2 in any of the sources (Bundler::GemNotFound)
  # Though running '/opt/boxen/rbenv/shims/gem list --local' works
  atom::package { ['linter-puppet-lint','language-puppet']: }

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'jakubholynet/dotfiles'
  }

  # Install editorconfig CLI (or does it Atom install automatically?)
  # The resource name must not clash with the atom package name
  package { 'editorconfig CLI': name => 'editorconfig', ensure => installed }

  shortcut {
  "iTerm Full Screen":
    app  => "com.googlecode.iterm2",
    key  => "cmd-shift-f",
    menu => "Toggle Full Screen"
  }

  include fish
  include dropbox
  package { 'skype': provider => 'brewcask' }

  osx::recovery_message { 'If this Mac is found, please call +46 966 23 666': }
  include osx::global::enable_keyboard_control_access
  include osx::global::enable_standard_function_keys
  include osx::dock::autohide
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::show_all_filename_extensions
  include osx::universal_access::ctrl_mod_zoom
  include osx::no_network_dsstores
  osx::dock::hot_corner { 'Bottom Left':
    action => 'Start Screen Saver'
  }
  osx::dock::hot_corner { 'Bottom Right':
    action => 'Put Display to Sleep'
  }
}
