variable "password" {
  type      = string
  sensitive = true
}

variable "user_name" {
  type      = string
  sensitive = true
}

# values can be passed using .tfvars or .tfvars.json files
# here i used .tfvars.json file as it is excluded in .gitignore but not .tfvars