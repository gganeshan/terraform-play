# Creating the VPC resource
resource "aws_vpc" "vpc" {
  cidr_block 		= "${var.vpc_cidr}"
}

# Creating the subnets
resource "aws_subnet" "vpc_subnets" {
  vpc_id                = "${aws_vpc.vpc.id}"
  count                 = "${length("${var.vpc_subnet_names}")}"
  cidr_block            = "${lookup("${var.vpc_cidr_blocks}", "${count.index}")}"
  availability_zone     = "us-east-1a"
  tags {
    Name                = "${lookup("${var.vpc_subnet_names}", "${count.index}")}"
  }
}
