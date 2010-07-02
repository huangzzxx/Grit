#!/usr/bin/env ruby
#
#  Created by Erik Aigner on 2/7/10.
#  Copyright 2010 chocomoko.com. All rights reserved.
#

class Rsquash < Pebble
  def run(grit_dir, cur_dir, args)    
    # fetch commit hash
    if args.first and args.first.length == 40
      @ref = args.first
    else
      puts "Commit argument not valid"
      return
    end
    
    # fetch commit message
    if args[1] and args[1].length > 0
      @msg = args[1]
    else
      puts "No new squashed commit message provided"
      return
    end
    
    # fetch gc argument
    if args[2] and args[2] == "--gc"
      @gc = true
    end
    
    system "git checkout -b _rsquash_old #{@ref}"
    @tree = `git write-tree`
    @num_squashed = `ruby #{grit_dir}/grit.rb revnum`
    
    @commit = `echo "** squashed previous history of #{@num_squashed.chomp} commits: #{@msg}" | git commit-tree #{@tree}`
    system "git checkout -b _rsquash_new #{@commit}"
    
    @ws = `git config --get apply.whitespace`
    system "git config --global apply.whitespace=nowarn"
    system "git rebase --onto _rsquash_new _rsquash_old master"
    system "git config --global apply.whitespace=#{@ws.chomp}"
    system "git checkout master"
    system "git branch -D _rsquash_old"
    system "git branch -D _rsquash_new"
    
    if @gc
      system "git gc --aggressive --prune"
    end
  end
  
  def help
    "syntax: grit rsquash <commit> <message> <? --gc>"
  end
end