# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "2.1.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "gcc",        "1.0.0"
github "git",        "1.2.2"
github "homebrew",   "1.1.2"
github "hub",        "1.0.0"
github "inifile",    "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",      "1.4.0"
github "nodejs",     "2.2.0"
github "repository", "2.0.2"
github "ruby",       "4.1.0"
github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",              "1.1.1"
github "appcleaner",         "1.0.0"
github "alfred" ,            "1.1.1"
github "better_touch_tools", "1.0.0"
github "charles",            "1.0.2", :repo => "newtriks/puppet-charles"
github "chrome",             "1.1.0"
github "codekit",            "1.0.1"
github "dropbox",            "1.1.0"
github "firefox",            "1.1.0"
github "gitx",               "1.2.0"
github "handbrake",          "1.0.0"
github "imageoptim",         "0.0.2"
github "istatmenus4",        "1.0.0"
github "iterm2",             "1.0.2"
github "onepassword",        "1.0.1"
github "rdio",               "1.0.0"
github "sequel_pro",         "1.0.0"
github "sublime_text",       "1.2.1", :repo => "slantview/puppet-sublime_text"
github "transmission",       "1.0.0"
github "transmit",           "1.0.0"
github "tunnelblick",        "1.0.0"
github "vagrant",            "2.0.7"
github "virtualbox",         "1.0.3"
github "vlc",                "1.0.1"
github "wget",         		   "1.0.0"
github "autoconf",         	 "1.0.0"
github "libtool",         	 "1.0.0"
github "pcre",          	   "1.0.0"
github "pkgconfig",          "1.0.0"
github "caffeine",           "1.0.0"
github "sublime_text_2",     "1.1.2"
github "php",                "1.1.0"
