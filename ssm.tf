resource "aws_ssm_parameter" "bgp_auth_key" {
  for_each = {
    for dx_connection in var.dx_connection : dx_connection.name => dx_connection
  }

  name        = "/dx/transit-vif/${var.account_name}/${each.value.name}/bgp_auth_key"
  description = each.value.name
  type        = "SecureString"
  value       = "Placeholder"

  lifecycle {
    ignore_changes = [value]
  }
}