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
    include autoconf
    include libtool
    include pkgconfig
    include pcre
    include caffeine
    include sublime_text_2
    include php::5_4
    include php::5_3_17
    include php::5_4_11

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

    sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
    }

    # Install a php version and set as the global default php
    class { 'php::global':
    version => '5.4.10'
    }

    # Ensure a specific php version is used within a directory
    php::local { '/path/to/my/awesome/project':
    version => '5.4.9'
    }

    # Ensure an extension is installed for a certain php version
    # note, you can't have duplicate resource names so you have to name like so
    php::extension::apc { "apc for ${version}":
    php     => $version,
    version => '3.1.13', # Optionally specify the extension version
    }

    # Set up PHP-FPM as a service running a specific version of PHP
    include php::fpm::5_3_15

    # Run multiple PHP-FPM services
    include php::fpm::5_4_11
    include php::fpm::5_3_23

    # Spin up a PHP-FPM pool for a project
    # Ensures:
    #  * the version of PHP is installed
    #  * a PHP-FPM service is configured for this PHP version
    #  * a FPM pool is listening on a per project nginx socket
    $name = "project-name"
    $version = "5.4.10"
    php::fpm::pool { "${name}-${version}":
    version     => $version,
    socket_path => "${boxen::config::socketdir}/${name}",
    require     => File["${nginx::config::sitesdir}/${name}.conf"],
    }
}
