variable "region" {}
variable "cidr_block" {}
variable "subnet_cidr" {
  type = list
  default =  ["190.160.1.0/24","190.160.2.0/24","190.160.3.0/24"]
}
variable "azs" {
  type = list
  default = ["us-east-1a","us-east-1b","us-east-1c"]
}