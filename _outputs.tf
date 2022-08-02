# output "dx_gateway_id" {
#   value       = aws_dx_gateway.default[0].id
#   description = "The ID of the gateway."
# }

# output "dx_gateway_owner_account_id" {
#   value       = aws_dx_gateway.default[0].owner_account_id
#   description = "AWS Account ID of the gateway."
# }

# output "dx_dw_association_id" {
#   value       = aws_dx_gateway_association.default[0].id
#   description = "The ID of the Direct Connect gateway association resource."
# }

# output "dx_gateway_associated_type" {
#   value       = aws_dx_gateway_association.default[0].associated_gateway_type
#   description = "The type of the associated gateway, transitGateway or virtualPrivateGateway."
# }

# output "dx_transit_vif_id" {
#   value       = aws_dx_transit_virtual_interface.default.id
#   description = "The ID of the virtual interface."
# }

# output "dx_transit_vif_arn" {
#   value       = aws_dx_transit_virtual_interface.default.arn
#   description = "The ARN of the virtual interface."
# }

# output "transit_gateway_arn" {
#   value       = aws_ec2_transit_gateway.default[0].arn
#   description = "EC2 Transit Gateway Amazon Resource Name (ARN)"
# }

# output "transit_gateway_id" {
#   value       = aws_ec2_transit_gateway.default[0].id
#   description = "EC2 Transit Gateway identifier"
# }

# output "transit_gateway_association_default_route_table_id" {
#   value       = aws_ec2_transit_gateway.default[0].association_default_route_table_id
#   description = "Identifier of the default association route table"
# }

# output "transit_gateway_owner_id" {
#   value       = aws_ec2_transit_gateway.default[0].owner_id
#   description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
# }

# output "transit_gateway_propagation_default_route_table_id" {
#   value       = aws_ec2_transit_gateway.default[0].propagation_default_route_table_id
#   description = "Identifier of the default propagation route table"
# }

# output "transit_gateway_vpc_attachment_id" {
#   value       = aws_ec2_transit_gateway_vpc_attachment.default.id
#   description = "EC2 Transit Gateway Attachment identifier"
# }

# output "transit_gateway_vpc_attachment_owner_id" {
#   value       = aws_ec2_transit_gateway_vpc_attachment.default.vpc_owner_id
#   description = "Identifier of the AWS account that owns the EC2 VPC."
# }

# output "transit_gateway_route_table_arn" {
#   value       = aws_ec2_transit_gateway_route_table.default.arn
#   description = "EC2 Transit Gateway Route Table Amazon Resource Name (ARN)."
# }

# output "transit_gateway_route_table_id" {
#   value       = aws_ec2_transit_gateway_route_table.default.id
#   description = "EC2 Transit Gateway Route Table identifier"
# }

# output "transit_gateway_route_table_default_association_route_table" {
#   value       = aws_ec2_transit_gateway_route_table.default[0].default_association_route_table
#   description = "Boolean whether this is the default association route table for the EC2 Transit Gateway."
# }

# output "transit_gateway_route_table_default_propagation_route_table" {
#   value       = aws_ec2_transit_gateway_route_table.default[0].default_propagation_route_table
#   description = "Boolean whether this is the default propagation route table for the EC2 Transit Gateway."
# }

# output "transit_gateway_route_id" {
#   value       = aws_ec2_transit_gateway_route.default[0].id
#   description = "EC2 Transit Gateway Route Table identifier combined with destination"
# }

# output "transit_gateway_blackhole_route_id" {
#   value       = aws_ec2_transit_gateway_route.blackhole.id
#   description = "Blackhole Route Table identifier"
# }