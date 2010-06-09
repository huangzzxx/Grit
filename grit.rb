#!/usr/bin/env ruby
#
#  Created by Erik Aigner on 9/6/10.
#  Copyright 2010 chocomoko.com. All rights reserved.
#


if __FILE__ == $0
  
  pebble = ARGV.first
  args = ARGV.slice(1, ARGV.length)
  
  require 'pebbles/#{module}'
  
  Kernel.const_get(pebble.capitylize).run(Dir.getwd, args)
end