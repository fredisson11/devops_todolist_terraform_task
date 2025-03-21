locals {
  sa_name = "${var.sa_name_prefix}${random_string.suffix.result}"
}