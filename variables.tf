variable "resource_group" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "name_suffix" {
  type = string
}

variable "target" {
  type = string
}

variable "ns_rules" {
  type    = list(map(string))
  default = []
}
