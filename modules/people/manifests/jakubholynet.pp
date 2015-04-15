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
  atom::package { ['linter', 'jshint', 'react','lodash-snippets','javascript-snippets','script','js-refactor','test-status']: }
  # Consider: mocha-test-runner
  # atom::package { 'editorconfig': } # Fails b/c pkg edit. already exists (but in himebrew, not atom)
  atom::package { ['linter-puppet-lint','language-puppet']: }

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'jakubholynet/dotfiles'
  }

  # Install editorconfig CLI (or does it Atom install automatically?)
  # The resource name must not clash with the atom package name
  package { 'editorconfig CLI': name => 'editorconfig', ensure => installed }
}
