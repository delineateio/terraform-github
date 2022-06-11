locals {
  commands = {
    svelte = "npm run build "
  }
  build_command = local.commands[var.web.web_info["framework"]]
}
