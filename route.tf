resource "aws_route" "default" {
  for_each = {
    for route in var.route : route => route
    if try(var.attachment, false) == true
  }

  route_table_id         = var.route_table_id[0]
  destination_cidr_block = each.key
  transit_gateway_id     = data.aws_ec2_transit_gateway.default[0].id
}