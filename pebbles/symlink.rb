#!/usr/bin/env ruby
#
#  Created by Erik Aigner on 9/6/10.
#  Copyright 2010 chocomoko.com. All rights reserved.
#

require "fileutils"

class Symlink < Pebble
  def run(grit_dir, cur_dir, args)
    link_path = "/usr/local/bin"
    remove = args.include?("remove")
    
    if args.first != nil and args.first != "remove"
      link_path = args.first
    end
    
    if remove
      `rm #{link_path}/grit`
    else
      FileUtils.mkdir_p(link_path)
      `ln -s #{grit_dir}/grit.rb #{link_path}/grit`;
      puts "Created symlink in #{link_path}"
    end
  end
  
  def help
    "syntax: ruby grit.rb symlink <? custom-path> <? 'remove'> "
  end
end