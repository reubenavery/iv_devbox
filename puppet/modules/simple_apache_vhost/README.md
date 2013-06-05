#simple_apache_vhost

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup and Usage](#setup-and-usage)
    * [Basic Setup](#basic-setup)
    * [Non Standard Ports](#non-standard-ports)
    * [Changing the Base Path](#changing-the-base-path)
4. [License](#license)
5. [Support](#support)
6. [Limitations](#limitations)
7. [Release Notes](#release-notes)

## Overview
This puppet module provisions a single simple Apache vhost in both HTTP and HTTPS modes, enabling pretty URLs and custom base file paths.

##Module Description

This puppet module provisions a single simple Apache vhost in both HTTP and HTTPS modes. The provisioned vhost has in-built rewrite rules to point HTTP traffic to the HTTPS site, or to follow the same rules as the HTTPS component. The "default" rewrite rules point all unfound locations to the index.php in the stated path.

##Setup and Usage

**What simple_apache_vhost affects:**

* Configuration files and directories (created and written to)
* Packages, Services and Configuration files
* Apache Modules
* Virtual Hosts
* Listened-to Ports

###Basic Setup

To install simple_apache_vhost with all the default options

    class { 'simple_apache_vhost': }

The defaults are determined by your operating system. Currently the only set 
of default options which have been configured are for the Debian/Ubuntu 
system, but migration should be very straightforward.

###Non Standard ports

To install simple_apache_vhost with non-standard ports and a provisioned 
SSL/TLS certificate

    class { 'simple_apache_vhost':
      http_port  => '1234',
      https_port => '12345',
      ssl_key    => '/tmp/ssl/key1',
      ssl_pem    => '/tmp/ssl/pem1'
    }

###Changing the base path

If you've got a web application (such as Zend or similar) and want to move your
normal web path to /var/www/public, you can do this by setting the `base_path`
value. You can also prevent auto-forwarding of traffic from the HTTP service to
the HTTPS service by changing the `redirect_to_ssl` to false.

    class { 'simple_apache_vhost':
      base_path       => "/var/www/public",
      redirect_to_ssl => false
    }

##License

Copyright (C) 2013 Jon Spriggs

Jon can be contacted at: jon@sprig.gs

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

##Support

Please raise issues, changes and pull requests at https://github.com/JonTheNiceGuy/JonTheNiceGuy-simple_apache_vhost

##Limitations

Currently this code only supports Debian and Ubuntu.

##Release Notes

This release note refers to the last release only. For previous notes, please see the commit log

* This is the initial release
