module "transit_gateway" {
  source = "git::https://github.com/DNXLabs/terraform-aws-transit-gateway.git?ref=0.0.1"

  name                       = local.workspace.org_name
  account_name               = local.workspace.account_name
  transit_gateway_account_id = local.workspace.transit_gateway.attachment.transit_gateway_account_id
  allowed_prefixes           = try(local.workspace.transit_gateway.allowed_prefixes, [])
  dns_support                = try(local.workspace.transit_gateway.dns_support, "enable")
  attachment                 = try(local.workspace.transit_gateway.attachment.enabled, false)
  vpc_id                     = module.network[0].vpc_id
  subnet_ids                 = module.network[0].private_subnet_ids
  route_table_id             = module.network[0].private_route_table_id
  route                      = try(local.workspace.transit_gateway.attachment.route, [])
  dx_connection              = try(local.workspace.transit_gateway.dx_connection, [])
  direct_connect_gateway_asn = try(local.workspace.transit_gateway.direct_connect_gateway_asn, "64512")
  transit_gateway_asn        = try(local.workspace.transit_gateway.transit_gateway_asn, "64513")
}