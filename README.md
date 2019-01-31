# Azure Network Security Group Module

This module create all required resources for deploy a Network Security Group with a list of security rules provisioned by the client.

## Usage

```bash
module "az_nsg" {
  source = "git::https://github.com/walmartdigital/k8s-nsg-module.git?ref=0.1.0"

  resource_group = "my-resource-group"
  cluster_name   = "my-cluster-name"
  environment    = "staging"
  name_suffix    = "abc123"

  ns_rules = [
    {
      name                       = "k8s-services"
      priority                   = "150"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      destination_port_range     = "30000-32767"
      source_address_prefix      = "Internet"
      destination_address_prefix = "VirtualNetwork"
      description                = "Port range for Kubernetes services"
    },
  ]
}
```

## Arguments

* **resource_group**: A string representing the resource group where all resources will be provisioned, this resource group needs to be previously created (required).
* **cluster_name**: A string used as the cluster name.
* **environment**: A string used as environment where the cluster is deployed.
* **name_suffix**: A string used as name suffix (type: string).
* **ns_rules**: A list of security rules, each item is a map object. You need to provide the following variables for each map item: _name_, _priority_, _direction_, _access_, _protocol_, _source_port_ranges_, _destination_port_ranges_, _source_address_prefix_, _destination_address_prefix_ and _description_.

## Outputs

* **network_security_group_id**: The Network security Group ID.
* **network_security_group_name**: The Network security Group name.