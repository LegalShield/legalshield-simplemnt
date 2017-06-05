# Define: simplemnt
# ===========================
#
# Full description of class simplemnt here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'simplemnt':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
define simplemnt (
  $server,
  $file_p = '0755',
  $dir = '/shared',
  $boot_up = 'true',
  $fstype = 'nfs',
  $options = 'defaults',
  $owner = 'root',
  $group = 'root'
) {

  file { $dir:
    ensure => 'directory',
    mode   => $file_p,
    owner  => $owner,
    group  => $group
  }

  mount { $dir:
    ensure => 'mounted',
    device => $server,
    fstype => $fstype,
    options => $options,
    atboot => $boot_up,
    require => File[$dir]
  }

}
