variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is the AMI id of devops-practice based on RHEL-9"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "tags" {
  type = map(any)
  default = {
    Name        = "backend"
    Project     = "Expense"
    Component   = "backend"
    Environment = "DEV"
    Terraform   = "true"
  }
}

variable "sg_name" {
  type    = string
  default = "allow_ssh"
}

variable "sg_description" {
  type    = string
  default = "allow ssh 22 ffrom terraform"
}

variable "from_port" {
  type    = number
  default = 22
}

variable "to_port" {
  type    = number
  default = 22
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}