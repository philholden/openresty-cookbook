# encoding: utf-8
name             'openresty'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures openresty'
version          '0.3.0'
recipe           'openresty::default', 'Installs/configures openresty'

depends 'chef-sugar'
depends 'apt'
