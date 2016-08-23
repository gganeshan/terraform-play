module "vpc" {
  # module source
  source                = "../../../../modules/network/vpc"

  # vpc name
  vpc_name              = "${var.vpc_name}"

  # vpc cidr
  cidr                  = "${var.vpc_cidr}"

  # private and public subnet cidr blocks ranges
  private_subnets       = "${var.private_subnet_cidr}"
  public_subnets        = "${var.public_subnet_cidr}"

  # availability zones
  azs                   = "${var.azs}"

  # private and public subnet names
  private_subnet_names = "${var.private_subnet_names}"
  public_subnet_names   = "${var.public_subnet_names}"

  # default resource name
  default_resource_name = "${var.default_resource_name}"

  # custom resource name
  custom_resource_name = "${var.custom_resource_name}"

  # default domain name
  default_dhcp_domain_name = "${var.default_dhcp_domain_name}"

  # default dhcp domain name servers
  default_dhcp_domain_name_servers = "${var.default_dhcp_domain_name_servers}"
}
