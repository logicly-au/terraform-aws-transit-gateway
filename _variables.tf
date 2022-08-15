variable "transit_gateway_enabled" {
  type        = bool
  description = "Enable or disable Transit Gateway"
}

variable "name" {
  type        = string
  description = "Name prefix for the resources of this stack"
}

variable "direct_connect_gateway_asn" {
  type        = number
  description = "The ASN to be configured on the Amazon side of the connection. The ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to 4,294,967,294."
}

variable "allowed_prefixes" {
  type        = list(string)
  default     = []
  description = "VPC prefixes (CIDRs) to advertise to the Direct Connect gateway. Defaults to the CIDR block of the VPC associated with the Virtual Gateway. To enable drift detection, must be configured."
}

variable "transit_gateway_asn" {
  type        = number
  default     = 64512
  description = "Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. Default value: 64512."
}

variable "default_route_table_association" {
  type        = string
  default     = "enable"
  description = "Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable. Default value: enable."
}

variable "default_route_table_propagation" {
  type        = string
  default     = "enable"
  description = "Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable. Default value: enable."
}

variable "dns_support" {
  type        = string
  default     = "enable"
  description = "Whether DNS support is enabled. Valid values: disable, enable. Default value: enable."
}

variable "attachment" {
  type        = bool
  default     = false
  description = "Create VPC Attachment to Transit Gateway"
}
variable "transit_gateway_default_route_table_association" {
  type        = bool
  default     = true
  description = "Boolean whether the VPC Attachment should be associated with the EC2 Transit Gateway association default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true."
}

variable "transit_gateway_default_route_table_propagation" {
  type        = bool
  default     = true
  description = "Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table. This cannot be configured or perform drift detection with Resource Access Manager shared EC2 Transit Gateways. Default value: true."
}

variable "transit_gateway_account_id" {
  type        = string
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags to attach to resources"
}

variable "dx_connection" {
  type        = list(any)
  default     = []
  description = "The name of the connection to retrieve."
}

variable "subnet_ids" {
  type        = list(any)
  default     = []
  description = " Identifiers of EC2 Subnets."
}

variable "vpc_id" {
  type        = string
  description = "Identifier of EC2 VPC."
}

variable "route_table_id" {
  type        = list(any)
  description = "Route Table Identifier"
}

variable "account_name" {
  type        = string
  description = "Name of the AWS account."
}

variable "route" {
  type        = list(any)
  description = "Destination CIDR block"
}

variable "network_acl_id" {
  type        = string
  description = "Network ACL ID"
}