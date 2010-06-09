#!/usr/bin/env ruby
#
#  Created by Erik Aigner on 9/6/10.
#  Copyright 2010 chocomoko.com. All rights reserved.
#

class Purge < Pebble
  def run(grit_dir, cur_dir, args)
    file = args[0]
    if file == nil
      puts "you did not provide a filename"
    else
      ref = args[1] ? args[1] : "HEAD"
      puts "Cleaning index..."
      res = `git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch #{file}" #{ref}`;
      
      puts "Removing refs..."
      res = `rm -rf .git/refs/original/`
      
      puts "Expire reflog..."
      res = `git reflog expire --all`
      
      puts "Collect garbage..."
      res = `git gc --aggressive --prune`

      puts "Done."
    end
  end
  
  def help
    "syntax: grit purge <filename> <? commit>"
  end
end