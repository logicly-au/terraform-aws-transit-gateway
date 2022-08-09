resource "aws_network_acl_rule" "in_requester_from_accepter" {
  for_each = {
    for route in var.route : route => route
    if try(var.attachment, false) == true
  }

  network_acl_id = var.network_acl_id
  rule_number    = 1000 + index(var.route, each.value)
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = each.key
}

resource "aws_network_acl_rule" "out_requester_to_accepter" {
  for_each = {
    for route in var.route : route => route
    if try(var.attachment, false) == true
  }

  network_acl_id = var.network_acl_id
  rule_number    = 1000 + index(var.route, each.value)
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = each.key
}