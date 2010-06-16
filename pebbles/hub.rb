#!/usr/bin/env ruby
#
#  Created by Erik Aigner on 9/6/10.
#  Copyright 2010 chocomoko.com. All rights reserved.
#

class Hub < Pebble
  def run(grit_dir, cur_dir, args)
    remotes = `git remote -v`;
    path = ""
    remotes.each_line {|l| path = l.gsub(/(.*git@)(github\.com):(.*)(\.git.*)/, 'http://\2/\3'); break}
    
    if path.length > 0
      system "open #{path}"
    else
      puts "Sorry, no github origin found!"
    end
  end
  
  def help
    "syntax: grit hub"
  end
end