resource "aws_ram_resource_share" "default" {
  count = try(var.attachment, false) ? 0 : 1

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
  count = try(var.attachment, false) ? 0 : 1

  resource_arn       = aws_ec2_transit_gateway.default[0].arn
  resource_share_arn = aws_ram_resource_share.default[0].arn
}

resource "aws_ram_principal_association" "default" {
  count = try(var.attachment, false) ? 0 : 1

  principal          = data.aws_organizations_organization.default.arn
  resource_share_arn = aws_ram_resource_share.default[0].arn
}