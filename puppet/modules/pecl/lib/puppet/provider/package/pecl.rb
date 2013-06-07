#
# PECL Puppet package provider
#
#-------------------------------------------------------------------------------
#
# This file is derived from (not the same as) the pecl.pp located here:
#
# http://www.mit.edu/~marthag/puppet/pecl.rb
#
# Kudos to Martha Greenberg for posting!
#

require 'puppet/provider/package'

#
# Package provider definition
#
Puppet::Type.type(:package).provide :pecl, :parent => Puppet::Provider::Package do

  #-----------------------------------------------------------------------------
  # Some configuration
  #  
  desc "PHP PECL support. By default uses the installed channels, but you
        can specify the path to a PECL package via ``source``."
  
  has_feature :versionable
  has_feature :upgradeable
  
  commands :peclcmd => "pecl"
  
  #-----------------------------------------------------------------------------
  # Capture all of the PECL extensions from a given string.
  #
  # Returned by [ pecl list ]
  #
  # If hash is indeed a hash and :justme is passed then all packages are
  # matched against that one and only the matching ones returned.
  #
  def self.pecllist(hash)
    command = [command(:peclcmd), "list"]

    begin
      list = execute(command).collect do |set|
        if hash[:justme]
          if  set =~ /^hash[:justme]/
            if peclhash = peclsplit(set)
              peclhash[:provider] = :pecl
              peclhash
            else
              nil
            end
          else
            nil
          end
        else
          if peclhash = peclsplit(set)
            peclhash[:provider] = :pecl
            peclhash
          else
            nil
          end
        end
      end.reject { |p| p.nil? }
      
      rescue Puppet::ExecutionFailure => detail
      raise Puppet::Error, "Could not list pecl: %s" % detail
    end

    if hash[:justme]
      return list.shift
    else
      return list
    end
  end

  #-----------------------------------------------------------------------------
  # Extract meta data from a text string about PECL packages.
  #
  # Unfortunately, this is an ugly work around for a linux command that does not
  # seem to have a more programmatic way of rendering the data.
  #
  # We are scraping here.  Whoohoo!
  #
  def self.peclsplit(desc)
    case desc
    
    when /^No entry for terminal/: return nil
    when /^using dumb terminal/: return nil
    when /^.*Installed.*/: return nil
    when /^=/: return nil
    when /^.*Package.*/: return nil
    when /^\s*$/: return nil
    when /^\(no packages installed\)$/: return nil
    
    when /^(\S+)\s+([.\da-zA-Z]+)\s+\S+\n/
      name = $1
      version = $2
      
      Puppet.debug "Pecl match %s  %s" % [ name, version ]
      
      return {
        :name => name,
        :ensure => version
      }
    
    else
      Puppet.warning "Could not match pecl %s" % desc
      nil
    end
  end

  #-----------------------------------------------------------------------------
  # Return all local PECL packages.
  #
  # Right now the :local option is not implemented but it would basically do 
  # what it's doing now anyway.  I guess this was for future expansion.
  #
  def self.instances
    which('pecl') or return []
    pecllist(:local => true).collect do |hash|
      new(hash)
    end
  end

  #-----------------------------------------------------------------------------
  # Install or upgrade PECL packages.
  #
  def install(useversion = true)
    command = ["upgrade"]

    if source = @resource[:source]
      command << source
    else
      if (! @resource.should(:ensure).is_a? Symbol) and useversion
        command << "#{@resource[:name]}-#{@resource.should(:ensure)}"
      else
        command << "#{@resource[:name]}"
      end
    end

    peclcmd(*command)
  end

  #-----------------------------------------------------------------------------
  # Get the latest version available for a PECL package.
  #
  # And more scraping...
  #
  def latest
    version = ''
    command = [command(:peclcmd), "remote-info", "#{@resource[:name]}"]
      list = execute(command).collect do |set|
      if set =~ /^Latest/
        version = set.split[1]
      end
    end
    return version
  end

  #-----------------------------------------------------------------------------
  # Return information for a specific PECL package.
  #
  def query
    self.class.pecllist(:justme => @resource[:name])
  end

  #-----------------------------------------------------------------------------
  # Uninstall a specific PECL package.
  #
  def uninstall
    output = peclcmd "uninstall", "#{@resource[:name]}"
    if output =~ /^uninstall ok/
    else
      raise Puppet::Error, output
    end
  end

  #-----------------------------------------------------------------------------
  # Update a PECL package.
  #
  def update
    self.install(false)
  end
end

