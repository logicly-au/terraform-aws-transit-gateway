resource "aws_dx_gateway" "default" {
  count = try(var.attachment, false) ? 0 : 1

  name            = "${var.name}-dx-gateway"
  amazon_side_asn = var.direct_connect_gateway_asn
}

resource "aws_dx_gateway_association" "default" {
  count = try(var.attachment, false) ? 0 : 1

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
  bgp_auth_key     = each.value.bgp_auth_key
}