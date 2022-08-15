resource "aws_ram_resource_share" "default" {
  count = var.attachment && var.transit_gateway_enabled ? 1 : (var.transit_gateway_enabled ? 1 : 0)

  name                      = "${var.name}-tgw-ram"
  allow_external_principals = true

  tags = merge(
    var.tags,
    {
      "Name"    = "${var.name}-tgw-ram"
      "EnvName" = var.account_name
    },
  )
}

resource "aws_ram_resource_association" "default" {
  count = var.attachment && var.transit_gateway_enabled ? 1 : (var.transit_gateway_enabled ? 1 : 0)

  resource_arn       = aws_ec2_transit_gateway.default[0].arn
  resource_share_arn = aws_ram_resource_share.default[0].arn
}

resource "aws_ram_principal_association" "default" {
  count = var.attachment && var.transit_gateway_enabled ? 1 : (var.transit_gateway_enabled ? 1 : 0)

  principal          = data.aws_organizations_organization.default.arn
  resource_share_arn = aws_ram_resource_share.default[0].arn
}