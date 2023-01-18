output "transit_gateway_arn" {
  value       = aws_transit_gateway
  description = "Transit Gateway ARN"
}

output "transit_gateway_id" {
  value       = aws_transit_gateway_id.id
  description = "Transit Gateway ID"
}

output "transit_gateway_route_table_id" {
  value       = aws_transit_gateway_route_table_id.id
  description = "Transit Gateway route table ID"
}

output "transit_gateway_association_default_route_table_id" {
  value       = aws_transit_gateway_association_default_route_table_id.id
  description = "Transit Gateway association default route table ID"
}

output "transit_gateway_propagation_default_route_table_id" {
  value       = aws_transit_gateway_propagation_default_route_table_id.id
  description = "Transit Gateway propagation default route table ID"
}

output "transit_gateway_vpc_attachment_ids" {
  value       = aws_transit_gateway_vpc_attachment_ids.ids
  description = "Transit Gateway VPC attachment IDs"
}

output "transit_gateway_route_ids" {
  value       = aws_transit_gateway_route_ids.ids
  description = "Transit Gateway route identifiers combined with destinations"
}

output "subnet_route_ids" {
  value       = aws_subnet_route_ids.ids
  description = "Subnet route identifiers combined with destinations"
}

output "ram_resource_share_id" {
  value       = aws_ram_resource_share_id.id
  description = "RAM resource share ID"
}

output "transit_gateway_vpc_attachment" {
  value       = aws_ec2_transit_gateway_vpc_attachment
  description = "RAM resource share ID"
}

output "transit_gateway_route_table" {
  value       = aws_ec2_transit_gateway_route_table
  description = "RAM resource share ID"
}

output "transit_gateway_route_table" {
  value       = aws_ec2_transit_gateway_route_table
  description = "RAM resource share ID"
}
