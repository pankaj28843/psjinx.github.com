#!/usr/bin/env ruby
unless ARGV[0]
  puts "Usage: newpost post-title"
  exit(-1)
end

SITE_DIR = File.expand_path(File.dirname(__FILE__)).split('/')[0..-2].join('/')

def slugify(title)
    str = title.dup
    str.gsub!(/[^a-zA-Z0-9 ]/,"")
    str.gsub!(/[ ]+/," ")
    str.gsub!(/ /,"-")
    str.downcase!
    str
end


title = ARGV.join(' ')
slug = slugify(title)
prefix = Time.new.strftime("%Y-%m-%d")
filename = "#{prefix}-#{slug}.mkd"
path = File.join(SITE_DIR, "/_posts/#{filename}")

header = <<-END
---
layout: post
title: "#{title}"
slug: "#{slug}"
published: false
tags:
    - tag 1
    - tag 2
category: general
author: psjinx
---

END

f = File.open(path, 'w')
f.write(header)
f.close

system("gvim --remote-tab-silent #{path}")
exit(0)
