#!/usr/bin/env ruby

# In TEAMS_TO_CLEAN put an array of the team names that you wish to clean.
# We will then parse the apps in the team(s) 
# And ask you if you want to delete each one
# We will skip locked apps, and delete apps from private spaces!

apps = []

#Put the target teams as elemts in this array i.e
# ["team1"] for one team or ["team1", team2"] for two
teams_to_clean = ["put a team name here"]

for team in teams_to_clean do
  apps.push(*`heroku apps --team #{team}`.split(/\n+/).drop(1))
end

for app in apps
  if app.include?("locked")
    puts "#{app} is a locked app, skipping"
  else
    puts "deleting app: #{app}, are you sure? (y/n)"
    #if you want to skip the question, comment out the next line and uncomment out the one below
    #this is dangerous, please only do this if you know what you are doing
    quest = gets
    # quest = "y"
    if quest.chr == "y"
      puts "deleting app #{app}"
      a = app.split(" ")
      `heroku destroy --app #{a[0]} --confirm #{a[0]}`
       puts "We just deleted app #{app}"
     else
       puts "skipping app #{app}"
     end
    end
end

  
