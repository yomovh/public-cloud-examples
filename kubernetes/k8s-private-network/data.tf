data "openstack_networking_network_v2" "my_private_network" {
  name   = var.pv_network_name
  region = var.region
}
