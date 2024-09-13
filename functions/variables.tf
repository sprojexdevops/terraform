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