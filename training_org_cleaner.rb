#!/usr/bin/env ruby

app_list = `heroku apps -o heroku-training`.split.to_a

bad_values = ["===", "Apps", "in", "organization", "heroku-training"]

bad_values.each do |bad|
  app_list.delete(bad)
end

puts "let's delete the following apps: "
app_list.each do |app|
  puts app
end

app_list.each do |app|
   puts `heroku join --app #{app}`
   puts `heroku info --app #{app}`
   puts "Destroying app #{app}!"
   puts `heroku destroy --app #{app} --confirm #{app}`
# Let's not run this with out confirmation
#  `heroku destroy --app #{app}`
end