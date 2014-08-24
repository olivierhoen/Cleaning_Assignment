# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("APItest", "a44b5fb3f416c993d3c9", secret="40d94cae5b01a44d4d1faf690ad87db936e76e6b")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/", config(token = github_token))
stop_for_status(req)
output <- content(req)
list(output[[4]]$name, output[[4]]$created_at)