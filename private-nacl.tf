resource "aws_network_acl_rule" "private_in_requester_from_accepter" {
  for_each = {
    for inbound_port in local.private_inbound_ports : "${inbound_port.cidr}:${inbound_port.port}" => inbound_port
    if try(var.attachment, false) == true
  }

  network_acl_id = var.private_network_acl_id
  rule_number    = 1000 + index(local.private_inbound_ports, each.value)
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = each.value.cidr
  from_port      = each.value.port
  to_port        = each.value.port == 0 ? "65535" : each.value.port
}

resource "aws_network_acl_rule" "private_out_requester_to_accepter" {
  for_each = {
    for outbound_port in local.private_outbound_ports : "${outbound_port.cidr}:${outbound_port.port}" => outbound_port
    if try(var.attachment, false) == true
  }

  network_acl_id = var.private_network_acl_id
  rule_number    = 1000 + index(local.private_outbound_ports, each.value)
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = each.value.cidr
  from_port      = each.value.port
  to_port        = each.value.port == 0 ? "65535" : each.value.port
}