locals {
  sa_name = "${var.prefix}${random_string.suffix.result}"
}