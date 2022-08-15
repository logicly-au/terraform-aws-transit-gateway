resource "aws_dx_gateway" "default" {
  count = var.attachment && var.transit_gateway_enabled ? 1 : (var.transit_gateway_enabled ? 1 : 0)

  name            = "${var.name}-dx-gateway"
  amazon_side_asn = var.direct_connect_gateway_asn
}

resource "aws_dx_gateway_association" "default" {
  count = var.attachment && var.transit_gateway_enabled ? 1 : (var.transit_gateway_enabled ? 1 : 0)

  dx_gateway_id         = aws_dx_gateway.default[0].id
  associated_gateway_id = aws_ec2_transit_gateway.default[0].id
  allowed_prefixes      = var.allowed_prefixes
}

resource "aws_dx_transit_virtual_interface" "default" {
  for_each = {
    for dx_connection in var.dx_connection : dx_connection.name => dx_connection
  }

  connection_id    = data.aws_dx_connection.default[each.value.name].id
  dx_gateway_id    = aws_dx_gateway.default[0].id
  name             = each.value.transit_vif_name
  amazon_address   = each.value.amazon_address
  customer_address = each.value.customer_address
  vlan             = each.value.vlan
  address_family   = "ipv4"
  bgp_asn          = each.value.bgp_asn
  bgp_auth_key     = data.aws_ssm_parameter.bgp_auth_key[each.value.name].value
}