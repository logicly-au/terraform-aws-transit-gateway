output "transit_gateway_id" {
  value       = aws_ec2_transit_gateway.default[0].id
  description = "Transit Gateway ID"
}

output "transit_gateway_route_table_private_id" {
  value       = aws_route.private.route_table_id
  description = "Transit Gateway route table private ID"
}

output "transit_gateway_route_table_public_id" {
  value       = aws_route.public.route_table_id
  description = "Transit Gateway route table public ID"
}

output "transit_gateway_route_table_secure_id" {
  value       = aws_route.secure.route_table_id
  description = "Transit Gateway route table secure ID"
}

output "transit_gateway_attachment_id" {
  value       = aws_ec2_transit_gateway_route.blackhole.transit_gateway_attachment_id
  description = "Transit Gateway route table secure ID"
}

output "transit_gateway_id" {
  value       = aws_ec2_transit_gateway_vpc_attachment.default.transit_gateway_id
  description = "Transit Gateway Default ID"
}
