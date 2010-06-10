#!/usr/bin/env ruby
#
#  Created by Erik Aigner on 9/6/10.
#  Copyright 2010 chocomoko.com. All rights reserved.
#

require 'pathname'

if __FILE__ == $0
  grit_dir = File.dirname(Pathname.new(__FILE__).realpath)
  pebble_name = ARGV.first
  args = ARGV.slice(1, ARGV.length)
  
  require "#{grit_dir}/src/pebble.rb"
  
  begin
    require "#{grit_dir}/pebbles/#{pebble_name}.rb"
    
    pebble = Kernel.const_get(pebble_name.capitalize).new
    
    if ["?", "help"].index(args.first)
      puts pebble.help()
    else
      pebble.run(grit_dir, Dir.getwd, args)
    end
  rescue LoadError
    puts "Pebble not found."
  end  
end