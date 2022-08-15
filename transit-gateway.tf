resource "aws_ec2_transit_gateway" "default" {
  count = var.attachment && var.transit_gateway_enabled ? 1 : (var.transit_gateway_enabled ? 1 : 0)

  description                     = "${var.name}-transit-gateway"
  amazon_side_asn                 = var.transit_gateway_asn
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = var.dns_support

  tags = merge(
    var.tags,
    {
      "Name"    = "${var.name}-transit-gateway"
      "EnvName" = var.name
    },
  )
}

resource "aws_ec2_transit_gateway_vpc_attachment" "default" {
  count = try(var.attachment, false) ? 1 : 0

  subnet_ids         = var.subnet_ids
  transit_gateway_id = data.aws_ec2_transit_gateway.default[0].id
  vpc_id             = var.vpc_id
  dns_support        = var.dns_support

  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true

  tags = merge(
    var.tags,
    {
      "Name"    = "${var.name}-${var.account_name}-tgw-vpc"
      "EnvName" = var.account_name
    },
  )
}

resource "aws_ec2_transit_gateway_route" "blackhole" {
  count = var.attachment && var.transit_gateway_enabled ? 1 : (var.transit_gateway_enabled ? 1 : 0)

  destination_cidr_block         = "0.0.0.0/0"
  blackhole                      = true
  transit_gateway_route_table_id = aws_ec2_transit_gateway.default[0].association_default_route_table_id
}