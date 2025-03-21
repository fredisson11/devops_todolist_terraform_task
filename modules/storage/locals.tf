locals {
  sa_name = "${var.sa_name_prefix}${random_string.sa_name_suffix.result}"
}