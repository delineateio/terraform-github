context = {
  owner    = "delineateio"
  name     = "new"
  basename = "delineate"
  extensions = {
    io  = { type = "website", value = "cname.vercel-dns.com", },
    run = { type = "health", value = "dashboards.checklyhq.com" },
  }
}

repo = {
  description = "My first automated repo"
  template = {
    name  = "oss-website"
    owner = "delineateio"
  }
  topics = ["Web", "Vercel", "Svelte"]
  settings = {
    collaborator = "delineateio-maintainers"
    permission   = "admin"
  }
  teams = [
    { name = "maintainers", role = "maintainer", usernames = ["jf-delineate"] },
    { name = "devs", role = "member", usernames = [] }
  ]
}

web = {
  web_type = "vercel"
  web_info = {
    framework = "svelte"
    team_id   = "team_WrenhIyRzR8VeOQGPTzI7nUn"
    region    = "ams"
  }
}

health = {
  health_type = "checkly"
  health_dashboard = {
    logo_url = "https://github.com/delineateio/.github/blob/master/assets/logo.png?raw=true"
  }
  health_checks = [{
    prefix    = "root"
    tld       = "io"
    frequency = 60
    locations = ["us-west-1"]
    settings = {
      runtime = "2021.10"
    }
  }]
  tld = "run"
}

# health {
#   health_type = "cloudflare"
#   health_checks = [{
#     prefix    = "root"
#     tld       = "io"
#     frequency = 60
#     locations = ["WEU", "EEU"]
#   }]
#   tld  = "run"
# }
