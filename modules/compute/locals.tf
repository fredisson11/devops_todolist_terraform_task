locals {
  script_name = element(split("/", var.script_url), length(split("/", var.script_url)) - 1)
}
