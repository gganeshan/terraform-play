module "vpc" {
  # module source
  source                = "../modules/network/vpc"

  # vpc name
  name                  = "my-vpc"

  # vpc cidr
  cidr                  = "${var.vpc_cidr}"

  # private and public subnet cidr blocks ranges
  private_subnets       = "${var.private_subnet_cidr}"
  public_subnets        = "${var.public_subnet_cidr}"

  # availability zones
  azs                   = "${var.azs}"

  # private and public subnet names
  private_subnet_names  = "${var.private_subnet_names}"
  public_subnet_names   = "${var.public_subnet_names}"
}
