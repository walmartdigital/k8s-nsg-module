variable "resource_group" {
  type = "string"
}

variable "name_suffix" {
  type = "string"
}

variable "ns_rules" {
  type    = "list"
  default = []
}
