#!/usr/bin/env ruby

# In TEAMS_TO_CLEAN put an array of the team names that you wish to clean.
# We will then parse the apps in the team(s) 
# And ask you if you want to delete each one
# If you wish to not get prompted for each one (DANGEROUS), just comment out the `gets` loop


TEAMS_TO_CLEAN =  ["lit-beach"] # ["heroku-psa"] ["heroku-se-demo"] ["heroku-training"] #
apps = []

for team in TEAMS_TO_CLEAN do
  apps.push(*`heroku apps --team #{team}`.split(/\n+/).drop(1))
end

for app in apps
  puts "deleting app: #{app}, are you sure? (y/n)"
  quest = gets
  if quest.chr == "y"
    puts "deleting app #{app}"
    `heroku destroy --app #{app} --confirm #{app}`
     puts "We just deleted app #{app}"
  else
    puts "skipping app #{app}"
  end
end

  
