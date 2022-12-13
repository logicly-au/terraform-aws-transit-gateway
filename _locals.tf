locals {
  private_inbound_ports = distinct(flatten([
    for each_cidr in var.private_route : [
      for each_port in each_cidr.nacl_inbound_tcp_ports : {
        cidr = each_cidr.cidr
        port = each_port
      }
  ]]))

  private_outbound_ports = distinct(flatten([
    for each_cidr in var.private_route : [
      for each_port in each_cidr.nacl_outbound_tcp_ports : {
        cidr = each_cidr.cidr
        port = each_port
      }
  ]]))

  public_inbound_ports = distinct(flatten([
    for each_cidr in var.public_route : [
      for each_port in each_cidr.nacl_inbound_tcp_ports : {
        cidr = each_cidr.cidr
        port = each_port
      }
  ]]))

  public_outbound_ports = distinct(flatten([
    for each_cidr in var.public_route : [
      for each_port in each_cidr.nacl_outbound_tcp_ports : {
        cidr = each_cidr.cidr
        port = each_port
      }
  ]]))
}