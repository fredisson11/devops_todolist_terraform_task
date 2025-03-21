locals {
  script_name = element(split("/", var.script_url), length(split("/", var.script_url)) - 1)
  script_path = "/var/lib/waagent/custom-script/download/0/${local.script_name}"
}