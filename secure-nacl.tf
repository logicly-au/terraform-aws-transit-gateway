resource "aws_network_acl_rule" "secure_in_requester_from_accepter" {
  for_each = {
    for inbound_port in local.secure_inbound_ports : "${inbound_port.cidr}:${inbound_port.port}" => inbound_port
    if try(var.attachment, false) == true
  }

  network_acl_id = var.secure_network_acl_id
  rule_number    = 1000 + index(local.secure_inbound_ports, each.value)
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = each.value.cidr
  from_port      = each.value.port
  to_port        = each.value.port == 0 ? "65535" : each.value.port
}

resource "aws_network_acl_rule" "secure_out_requester_to_accepter" {
  for_each = {
    for outbound_port in local.secure_outbound_ports : "${outbound_port.cidr}:${outbound_port.port}" => outbound_port
    if try(var.attachment, false) == true
  }

  network_acl_id = var.secure_network_acl_id
  rule_number    = 1000 + index(local.secure_outbound_ports, each.value)
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = each.value.cidr
  from_port      = each.value.port
  to_port        = each.value.port == 0 ? "65535" : each.value.port
}
