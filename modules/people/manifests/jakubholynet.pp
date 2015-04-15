class people::jakubholynet {
  #include emacs   # requires emacs module in Puppetfile
  #include sparrow # requires sparrow module in Puppetfile

  include alfred
  include iterm2::dev # see https://github.com/boxen/puppet-iterm2

  include atom
  atom::package { 'linter': }

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${my}/dotfiles"

  repository { $dotfiles:
    source  => 'jakubholynet/dotfiles'
  }
}
