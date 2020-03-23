#!/usr/bin/env ruby

gems = `gem list --no-version`.split

gems.each do |g|
  
  puts "removing gem #{g}"
  `gem uninstall #{g} --force -I -x`
  
end

puts "running a cleanup"
`gem cleanup`