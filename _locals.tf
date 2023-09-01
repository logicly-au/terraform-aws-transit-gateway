locals {
  private_inbound_ports = distinct(flatten([
    for each_cidr in var.private_route : [
      for each_port in each_cidr.nacl_inbound_ports : {
        cidr = each_cidr.cidr
        port = each_port
        protocol = each_cidr.protocol
      }
  ]]))

  private_outbound_ports = distinct(flatten([
    for each_cidr in var.private_route : [
      for each_port in each_cidr.nacl_outbound_ports : {
        cidr = each_cidr.cidr
        port = each_port
        protocol = each_cidr.protocol
      }
  ]]))

  public_inbound_ports = distinct(flatten([
    for each_cidr in var.public_route : [
      for each_port in each_cidr.nacl_inbound_ports : {
        cidr = each_cidr.cidr
        port = each_port
        protocol = each_cidr.protocol
      }
  ]]))

  public_outbound_ports = distinct(flatten([
    for each_cidr in var.public_route : [
      for each_port in each_cidr.nacl_outbound_ports : {
        cidr = each_cidr.cidr
        port = each_port
        protocol = each_cidr.protocol
      }
  ]]))

  secure_inbound_ports = distinct(flatten([
    for each_cidr in var.secure_route : [
      for each_port in each_cidr.nacl_inbound_ports : {
        cidr = each_cidr.cidr
        port = each_port
        protocol = each_cidr.protocol
      }
  ]]))

  secure_outbound_ports = distinct(flatten([
    for each_cidr in var.secure_route : [
      for each_port in each_cidr.nacl_outbound_ports : {
        cidr = each_cidr.cidr
        port = each_port
        protocol = each_cidr.protocol
      }
  ]]))
}
