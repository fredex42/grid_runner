When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `#{app_name} help`)
end


When /^I call "([^"]*)" for "([^"]*)"$/ do |command, app_name|
  @app_name = app_name
  step %(I run `#{app_name} #{command}`)
end


# Add more step definitions here
