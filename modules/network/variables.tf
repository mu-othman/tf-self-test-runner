# Variable Definition File
variable "region" {
  type    = string
  default = "us-west-2"
}

variable "sql_server_main_vpc_id" {
  type    = string
  default = "vpc-0039235b1ea37c139"
}

variable "sql_server_main_vpc_cidr" {
  type    = string
  default = "10.40.0.0/16"
}

variable "target_peer_vpc_id" {
  type = string
}

variable "target_peer_vpc_cidr" {
  type = string
}

variable "target_peer_vpc_owner_id" {
  type = string
}

variable "target_peer_vpc_region" {
  type = string
}

variable "target_peer_vpc_role_arn" {
  type = string
}
