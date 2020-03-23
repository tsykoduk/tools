#!/usr/bin/env ruby

# In TEAMS_TO_CLEAN put an array of the team names that you wish to clean.
# We will then parse the apps in the team(s) 
# And ask you if you want to delete each one
# We will skip locked apps, and delete apps from private spaces!

apps = []

#Put the target teams as elemts in this array i.e
# ["team1"] for one team or ["team1", team2"] for two
teams_to_upgrade = ["heroku-se-demo"]

teams_to_upgrade.each do |team|
  apps.push(*`heroku apps --team #{team}`.split(/\n+/).drop(1))
end

#Set up run env
cur_folder = `pwd`
Dir.chdir "/tmp/"

for b in apps
  a = b.split[0]
  puts "updating app #{a}"
  `heroku stack:set heroku-18 --app #{a}`
   puts "We just updated app #{a} to heroku-18. Next we need to create an empty release on it"
   puts "we will create an temp dir, and clone into it"

   `mkdir /tmp/temp_#{a}`
   Dir.chdir "/tmp/temp_#{a}"
   `heroku git:clone -a #{a}`
       
   puts "Pulled the app down, let's create an empty push"
   `git commit --allow-empty -m "Upgrading to heroku-18"`
   `git push heroku master`
       
   puts "done, let's clean up"
   Dir.chdir "/tmp/"
   `rm -rf /tmp/temp_#{a}`
       
end

Dir.chdir cur_folder