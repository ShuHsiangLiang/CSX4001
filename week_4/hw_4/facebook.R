library(devtools)
library(Rfacebook)
library(httr)

require(Rfacebook)

oauth_endpoints("facebook")

app <- oauth_app('facebook', "2037229306327306", "671867d99062ca07b901de6950059ddb")
fb_token <- oauth2.0_token(oauth_endpoints("facebook"), app,
                           scope = c("ads_management", "read_insights"),
                           type  = "application/x-www-form-urlencoded", 
                           cache = FALSE)
save(fb_token, file = "~/Documents/GitHub/CSX4001/week_4/fb_token")

# fb.oauth <- fbOAuth(
#   app_id = "2037229306327306",
#   app_secret = "671867d99062ca07b901de6950059ddb",
#   extended_permissions = TRUE)
#
# save(fb.oauth, file = "fb_oauth")
# 
# load("fb_oauth")
# 
# fb.oauth

me <- getUsers("me", token=fb_token)
me$name

token <- "EAAc82WkhMQoBAPRIrhdEFHGExh6iZBeaUEO2il67mBOHjWHtEhOfZCJbB8FQCmvDwvWLrFzwHtArLLNlRG5DgSEzmhQ5BWuME2rgRKDH3xrpYGUpzZCW0CwBG63WPfZATjy4SQZAgDwuljznq05kauPkbQuagd2exiAZB5wKZCZCwoIKoZCnVYQVs76me4q4NrOoXZAORQxz8UxwZDZD"

page.id <- "629395343901798"
page <- getPage(page.id, token, n = 100)
str(page)

