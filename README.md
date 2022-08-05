# terraform-aws-transit-gateway

This module creates the transit gateway network resources.

The following resources will be created:
 - Direct Connect Data resource
 - AWS Organization Data resource
 - Direct Connect Gateway
 - Direct Connect Gateway Association   
 - Direct Connect Transit Virtual Interface
 - Transit Gateway
 - Transit Gateway Blackhole Route
 - Transit Gateway Route
 - Transit Gateway VPC Attachment
 - Resource Access Manager (RAM) Resource Share
 - Resource Access Manager (RAM) Resource Association
 - Resource Access Manager (RAM) Principal Association
 - SSM Security String Parameter

## Execution Diagram of `terraform-transit-gateway`
![](_docs/assets/TransitGateway.png)

## Usage

```hcl
module "transit_gateway" {
  source = "git::https://github.com/DNXLabs/terraform-aws-transit-gateway.git?ref=0.0.1"

  name                       = local.workspace.org_name
  account_name               = local.workspace.account_name
  transit_gateway_account_id = local.workspace.transit_gateway.attachment.transit_gateway_account_id
  allowed_prefixes           = try(local.workspace.transit_gateway.allowed_prefixes, [])
  dns_support                = try(local.workspace.transit_gateway.dns_support, "enable")
  attachment                 = try(local.workspace.transit_gateway.attachment.enabled, false)
  vpc_id                     = module.network[0].vpc_id
  subnet_ids                 = module.network[0].private_subnet_ids
  route_table_id             = module.network[0].private_route_table_id
  dx_connection              = try(local.workspace.transit_gateway.dx_connection, [])
  direct_connect_gateway_asn = try(local.workspace.transit_gateway.direct_connect_gateway_asn, "64512")
  transit_gateway_asn        = try(local.workspace.transit_gateway.transit_gateway_asn, "64513")
  route                      = try(local.workspace.transit_gateway.attachment.route, [])
}
```

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.56.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 2.1.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.56.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dx_gateway.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_gateway) | resource |
| [aws_dx_gateway_association.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_gateway_association) | resource |
| [aws_dx_transit_virtual_interface.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dx_transit_virtual_interface) | resource |
| [aws_ec2_transit_gateway.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway) | resource |
| [aws_ec2_transit_gateway_route.blackhole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_vpc_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_ram_principal_association.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_principal_association) | resource |
| [aws_ram_resource_association.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_association) | resource |
| [aws_ram_resource_share.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ram_resource_share) | resource |
| [aws_route.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_dx_connection.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/dx_connection) | data source |
| [aws_ec2_transit_gateway.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway) | data source |
| [aws_ec2_transit_gateway_dx_gateway_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway_dx_gateway_attachment) | data source |
| [aws_organizations_organization.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | Name of the AWS account. | `string` | n/a | yes |
| <a name="input_allowed_prefixes"></a> [allowed\_prefixes](#input\_allowed\_prefixes) | VPC prefixes (CIDRs) to advertise to the Direct Connect gateway. Defaults to the CIDR block of the VPC associated with the Virtual Gateway. To enable drift detection, must be configured. | `list(string)` | `[]` | no |
| <a name="input_attachment"></a> [attachment](#input\_attachment) | Create VPC Attachment to Transit Gateway | `bool` | `false` | no |
| <a name="input_default_route_table_association"></a> [default\_route\_table\_association](#input\_default\_route\_table\_association) | Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable. Default value: enable. | `string` | `"enable"` | no |
| <a name="input_default_route_table_propagation"></a> [default\_route\_table\_propagation](#input\_default\_route\_table\_propagation) | Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable. Default value: enable. | `string` | `"enable"` | no |
| <a name="input_direct_connect_gateway_asn"></a> [direct\_connect\_gateway\_asn](#input\_direct\_connect\_gateway\_asn) | The ASN to be configured on the Amazon side of the connection. The ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to 4,294,967,294. | `number` | n/a | yes |
| <a name="input_dns_support"></a> [dns\_support](#input\_dns\_support) | Whether DNS support is enabled. Valid values: disable, enable. Default value: enable. | `string` | `"enable"` | no |
| <a name="input_dx_connection"></a> [dx\_connection](#input\_dx\_connection) | The name of the connection to retrieve. | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name prefix for the resources of this stack | `string` | n/a | yes |
| <a name="input_route"></a> [route](#input\_route) | n/a | `any` | n/a | yes |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | n/a | `any` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Identifiers of EC2 Subnets. | `list(any)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags to attach to resources | `map(string)` | `{}` | no |
| <a name="input_transit_gateway"></a> [transit\_gateway](#input\_transit\_gateway) | Enable or disable Transit Gateway | `bool` | `false` | no |
| <a name="input_transit_gateway_account_id"></a> [transit\_gateway\_account\_id](#input\_transit\_gateway\_account\_id) | Identifier of the AWS account that owns the EC2 Transit Gateway. | `string` | n/a | yes |
| <a name="input_transit_gateway_asn"></a> [transit\_gateway\_asn](#input\_transit\_gateway\_asn) | Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. Default value: 64512. | `number` | `64512` | no |
| <a name="input_transit_gateway_default_route_table_association"></a> [transit\_gateway\_default\_route\_table\_association](#input\_transit\_gateway\_default\_route\_table\_association) | Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true. | `bool` | `true` | no |
| <a name="input_transit_gateway_default_route_table_propagation"></a> [transit\_gateway\_default\_route\_table\_propagation](#input\_transit\_gateway\_default\_route\_table\_propagation) | Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true. | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier of EC2 VPC. | `string` | n/a | yes |
<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-transit-gateway/blob/master/LICENSE) for full details.
