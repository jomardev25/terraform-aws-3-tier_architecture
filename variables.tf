variable "public_web_subnet_ips" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.3.0/24"]
}


variable "private_app_subnet_ips" {
  type    = list(any)
  default = ["10.0.2.0/24", "10.0.4.0/24"]
}

variable "private_db_subnet_ips" {
  type    = list(any)
  default = ["10.0.6.0/24", "10.0.8.0/24"]
}

variable "az" {
  type    = list(any)
  default = ["us-west-2a", "us-west-2b"]
}