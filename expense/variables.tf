variable "instance_name" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "Expense"
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "zone_id" {
  type = string
  default = "Z00458691QAOCFQ5Z2CDA"
}

variable "domain_name" {
  type = string
  default = "sprojex.in"
}