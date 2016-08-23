resource "aws_vpc" "custom" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.custom.id}"
  cidr_block        = "${var.private_subnets[count.index]}"
  availability_zone = "${var.azs[count.index]}"
  count             = "${length(var.private_subnets)}"

  tags {
    Name = "${var.private_subnet_names[count.index]}"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.custom.id}"
  cidr_block        = "${var.public_subnets[count.index]}"
  availability_zone = "${var.azs[count.index]}"
  count             = "${length(var.public_subnets)}"
  depends_on	    = ["aws_internet_gateway.custom"]

  tags {
    Name = "${var.public_subnet_names[count.index]}"
  }

  map_public_ip_on_launch = true
}

resource "aws_security_group" "default" {
  name 		= "${var.default_resource_name}"
  description 	= "Default security group"
  vpc_id 	= "${aws_vpc.custom.id}"
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks	= ["0.0.0.0/0"]
  }

  tags {
      Name = "${var.default_resource_name}"
  }
}

resource "aws_network_acl" "private" {
  vpc_id 	= "${aws_vpc.custom.id}"
  subnet_ids	= ["${aws_subnet.private.*.id}"]
  depends_on 	= ["aws_subnet.private"]

  tags {
      Name = "${var.default_resource_name}"
  }
}

resource "aws_network_acl" "public" {
  vpc_id 	= "${aws_vpc.custom.id}"
  subnet_ids	= ["${aws_subnet.public.*.id}"]
  depends_on 	= ["aws_subnet.public"]

  tags {
      Name = "${var.default_resource_name}"
  }
}

resource "aws_vpc_dhcp_options" "default" {
  domain_name = "${var.default_dhcp_domain_name}"
  domain_name_servers = ["${var.default_dhcp_domain_name_servers}"]

  tags {
      Name = "${var.default_resource_name}"
  }
}

resource "aws_vpc_dhcp_options_association" "default" {
  vpc_id 		= "${aws_vpc.custom.id}"
  dhcp_options_id 	= "${aws_vpc_dhcp_options.default.id}"
  depends_on            = ["aws_vpc_dhcp_options.default"]
}

resource "aws_internet_gateway" "custom" {
    vpc_id = "${aws_vpc.custom.id}"
    depends_on	= ["aws_vpc.custom"]

    tags {
        Name = "${var.custom_resource_name}"
    }
}

resource "aws_vpn_gateway" "custom" {
    vpc_id = "${aws_vpc.custom.id}"

    tags {
        Name = "${var.custom_resource_name}"
    }
}

/*
resource "aws_internet_gateway" "mod" {
  vpc_id = "${aws_vpc.custom.id}"
}

resource "aws_route_table" "public" {
  vpc_id           = "${aws_vpc.custom.id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]

  tags {
    Name = "${var.vpc_name}-public"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.custom.id}"
}

resource "aws_route_table" "private" {
  vpc_id           = "${aws_vpc.custom.id}"
  propagating_vgws = ["${var.private_propagating_vgws}"]

  tags {
    Name = "${var.vpc_name}-private"
  }
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.private_subnets)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.public_subnets)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
*/
