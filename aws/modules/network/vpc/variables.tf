variable "vpc_name" {}

variable "cidr" {}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "public_subnet_names" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "private_subnet_names" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "azs" {
  description = "A list of Availability zones in the region"
  default     = []
}


variable "enable_dns_hostnames" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "default_resource_name" {
  description = "default resource name"
  default     = ""
}

variable "custom_resource_name" {
  description = "custom resource name"
  default     = ""
}

variable "default_dhcp_domain_name" {
  description = "default dhcp options domain name"
  default     = ""
}

variable "default_dhcp_domain_name_servers" {
  description = "default dhcp options domain name servers"
  default     = []
}

/*
variable "default_security_group_name" {
  description = "default security group name"
  default     = ""
}

variable "default_network_acl_name" {
  description = "default network acl name"
  default     = ""
}
variable "default_dhcp_options_name" {
  description = "default dhcp options name"
  default     = ""
}
variable "private_propagating_vgws" {
  description = "A list of VGWs the private route table should propagate."
  default     = []
}

variable "public_propagating_vgws" {
  description = "A list of VGWs the public route table should propagate."
  default     = []
}
*/
