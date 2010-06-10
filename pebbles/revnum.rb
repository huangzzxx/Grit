#!/usr/bin/env ruby
#
#  Created by Erik Aigner on 9/6/10.
#  Copyright 2010 chocomoko.com. All rights reserved.
#

class Revnum < Pebble
  def run(grit_dir, cur_dir, args)
    ref = args.first ? args.first : "HEAD"
    commit = `git rev-parse #{ref}`;
    revlist = `git rev-list #{commit.chomp}`
    revnum = revlist.scan(/\n/).count
    puts revnum
  end
  
  def help
    "syntax: grit revnum <? commit>"
  end
end