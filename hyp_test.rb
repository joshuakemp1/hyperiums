#!/usr/bin/env ruby

require './hyperiums'

uname = ARGV[0]
pass = ARGV[1]

hyp = Hyperiums.new(uname, pass)

hyp.login()
hyp.home()
hyp.logout()