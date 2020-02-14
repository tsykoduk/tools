#!/usr/bin/env ruby

# In TEAMS_TO_CLEAN put an array of the team names that you wish to clean.
# We will then parse the apps in the team(s) 
# And ask you if you want to delete each one
# We will skip locked apps, and delete apps from private spaces!
# If you wish to not get prompted for each one (DANGEROUS), just comment out the `gets` loop


apps = []


#Put the target teams as elemts in this array
teams_to_clean = ["team1", "team2"]


for team in teams_to_clean do
  apps.push(*`heroku apps --team #{team}`.split(/\n+/).drop(1))
end

for app in apps
  if app.include?("locked")
    puts "#{app} is a locked app, skipping"
  else
    puts "deleting app: #{app}, are you sure? (y/n)"
    # quest = gets
    # if quest.chr == "y"
      puts "deleting app #{app}"
      a = app.split(" ")
      `heroku destroy --app #{a[0]} --confirm #{a[0]}`
       puts "We just deleted app #{app}"
       # else
       #   puts "skipping app #{app}"
       # end
     end
end

  
