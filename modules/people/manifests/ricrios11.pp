class people::ricrios11 {
    # Applications
    include adium
    include appcleaner
    include alfred
    include better_touch_tools
    include charles
    include chrome::dev
    include chrome::canary
    include codekit
    include dropbox
    include firefox
    include github_for_mac
    include gitx::dev
    include imageoptim
    include istatmenus4
    include iterm2::dev
    include rdio
    include sequel_pro
    include sublime_text
    include transmit
    include tunnelblick
    include vagrant
    include virtualbox
    include vlc
    include wget
    #include php::5_4
 
    # Machine-specific apps
    case $::hostname {
        'ares': {
            include handbrake
            include transmission
        }
        default: {}
    }
 
    # Configuration Setup
    $env = {
        directories => {
            home     => "/Users/${::boxen_user}",
            repos    => "/Users/${::boxen_user}/Code",
            dotfiles => "/Users/${::boxen_user}/Code/dotfiles"
        }
    }
 
    # Dotfile Setup
    file { "${env['directories']['repos']}":
        ensure => "directory"
    }
    ~> repository { "${env['directories']['dotfiles']}":
        source  => "ricrios11/dotfiles",
        require => File["${env['directories']['repos']}"]
    }
    ~> exec { "Install dotfiles":
        cwd         => "${env['directories']['dotfiles']}",
        command     => "./sync.sh --force",
        provider    => shell,
        refreshonly => true,
        require     => Repository["${env['directories']['dotfiles']}"]
    }
 
    # Set node.js version
    class { 'nodejs::global': version => 'v0.10.5' }
 
    # Install some node modules
    nodejs::module { 'grunt-cli':
      node_version => 'v0.10'
    }

    
}