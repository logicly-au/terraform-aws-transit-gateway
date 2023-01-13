# terraform-aws-transit-gateway

This module creates the transit gateway network resources.

The following resources will be created:
 - Direct Connect Data resource
 - AWS Organization Data resource
 - Direct Connect Gateway
 - Direct Connect Gateway Association   
 - Direct Connect Transit Virtual Interface
 - Transit Gateway
 - Transit Gateway Blackhole Route
 - Transit Gateway Route
 - Transit Gateway VPC Attachment
 - Resource Access Manager (RAM) Resource Share
 - Resource Access Manager (RAM) Resource Association
 - Resource Access Manager (RAM) Principal Association
 - SSM Security String Parameter

## Execution Diagram of `terraform-transit-gateway`
![](_docs/assets/TransitGateway.png)

## Usage

```hcl
module "transit_gateway" {
  source = "git::https://github.com/DNXLabs/terraform-aws-transit-gateway.git?ref=1.0.0"

  name                       = local.workspace.org_name
  account_name               = local.workspace.account_name
  transit_gateway_account_id = local.workspace.transit_gateway.attachment.transit_gateway_account_id
  allowed_prefixes           = try(local.workspace.transit_gateway.allowed_prefixes, [])
  dns_support                = try(local.workspace.transit_gateway.dns_support, "enable")
  attachment                 = try(local.workspace.transit_gateway.attachment.enabled, false)
  transit_gateway_enabled    = try(local.workspace.transit_gateway.enabled, false)
  vpc_id                     = module.network[0].vpc_id
  subnet_ids                 = module.network[0].private_subnet_ids
  private_route_table_id     = module.network[0].private_route_table_id[0]
  public_route_table_id      = module.network[0].public_route_table_id
  private_network_acl_id     = module.network[0].private_nacl_id
  public_network_acl_id      = module.network[0].public_nacl_id
  dx_connection              = try(local.workspace.transit_gateway.dx_connection, [])
  direct_connect_gateway_asn = try(local.workspace.transit_gateway.direct_connect_gateway_asn, "64512")
  transit_gateway_asn        = try(local.workspace.transit_gateway.transit_gateway_asn, "64513")
  public_route               = try(local.workspace.transit_gateway.attachment.public_route, [])
  private_route              = try(local.workspace.transit_gateway.attachment.private_route, [])
}
```

<!--- BEGIN_TF_DOCS --->

Error: Argument or block definition required: An argument or block definition is required here.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-transit-gateway/blob/master/LICENSE) for full details.
