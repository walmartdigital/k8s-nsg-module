# Azure Network Security Group Module

This module create all required resources for deploy a Network Security Group with a list of security rules provisioned by the client, all of this to be used in a Kubernetes Cluster.

## Usage

```bash
module "az_nsg" {
  source = "git::https://github.com/walmartdigital/k8s-nsg-module.git?ref=0.0.1"

  resource_group = "my-resource-group"
  cluster_name = "my-cluster-name"
  environment = "staging"
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

* **resource_group**: Resource group where all resources will be provisioned (type: string, required).
* **cluster_name**: Name of the cluster (type: string, default: kubernetes).
* **environment**: Environment where the cluster is deployed (type: string, default: labs).
* **name_suffix**: A string used as name suffix (type: string).
* **ns_rules**: A list of security rules, each item is a map object. You need to provide the following variables for each map item: name, priority, direction, access, protocol, source_port_ranges, destination_port_ranges, source_address_prefix, destination_address_prefix and description.

## Outputs

* **network_security_group_id**: The Network security Group ID.
* **network_security_group_name**: The Network security Group name.