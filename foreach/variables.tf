variable "instnace" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "zone_id" {
  type    = string
  default = "Z00458691QAOCFQ5Z2CDA"
}

variable "domain_name" {
  type    = string
  default = "sprojex.in"
}