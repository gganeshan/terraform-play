# VPC name
variable "vpc_name" {
  default 		= "project_name.poc"
}

# VPC CIDR blocks
variable "vpc_cidr" {
  default               = "10.7.0.0/24"
}

# private subnet names                                      
variable "private_subnet_names" {
  default 		= 
  [
    "project_name.poc.perimeter.a", 
    "project_name.poc.perimeter.c" 
  ]
}

# public subnet names
variable "public_subnet_names" {          
  default 		= []
}                                          

# private subnet CIDR blocks                              
variable "private_subnet_cidr" {           
  default               = 
  [
    "10.7.0.0/27", 
    "10.7.0.32/27" 
  ]
} 

# public subnet CIDR blocks
variable "public_subnet_cidr" {            
  default 		= []                             
}

# azs
variable "azs" {
  default = 
  [
    "us-west-2a", 
    "us-west-2b"
  ]
}

# default dhcp domain name
variable "default_dhcp_domain_name" {
  default = "ec2.internal"
}

# default dhcp domain name servers
variable "default_dhcp_domain_name_servers" {
  default = 
  [
    "AmazonProvidedDNS"
  ]
}

# default resource name
variable "default_resource_name" {
  default = "project_name.poc.default"
}

# custom resource name
variable "custom_resource_name" {
  default = "project_name.poc"
}
