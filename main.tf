terraform {
  required_version = ">= 0.12"
}

data "azurerm_resource_group" "main" {
  name = var.resource_group
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.cluster_name}-${var.environment}-${var.name_suffix}-${var.target}-nsg"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
}

resource "azurerm_network_security_rule" "ns_rules" {
  count                       = length(var.ns_rules)
  name                        = lookup(var.ns_rules[count.index], "name", "default_rule")
  priority                    = var.ns_rules[count.index]["priority"]
  direction                   = lookup(var.ns_rules[count.index], "direction", "Any")
  access                      = lookup(var.ns_rules[count.index], "access", "Allow")
  protocol                    = lookup(var.ns_rules[count.index], "protocol", "*")
  source_port_range           = lookup(var.ns_rules[count.index], "source_port_range", "*")
  destination_port_range      = lookup(var.ns_rules[count.index], "destination_port_range", "*")
  source_address_prefix       = lookup(var.ns_rules[count.index], "source_address_prefix", "*")
  source_address_prefixes     = lookup(var.ns_rules[count.index], "source_address_prefixes", "*")
  destination_address_prefix  = lookup(var.ns_rules[count.index], "destination_address_prefix", "*")
  description                 = lookup(var.ns_rules[count.index], "description", "Security rule for ${lookup(var.ns_rules[count.index], "name", "default_rule")}")
  resource_group_name         = data.azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
