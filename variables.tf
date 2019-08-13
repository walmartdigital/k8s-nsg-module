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

variable "ns_rules" {
  type    = list(object({ rule = map(string) }))
  default = []
}
