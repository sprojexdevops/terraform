locals {
  zone_id       = "Z00458691QAOCFQ5Z2CDA"
  domain_name   = "sprojex.in"
  instance_type = var.environment == "prod" ? "t3.small" : "t3.micro"

  # count will not work in locals
}